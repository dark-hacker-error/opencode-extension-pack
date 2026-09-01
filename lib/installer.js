const fs = require('fs');
const path = require('path');
const logger = require('./logger');
const fileUtils = require('./file-utils');

const HOME = process.env.HOME || '/root';
const INSTALL_DIR = path.join(HOME, '.config', 'opencode');
const BACKUP_DIR = path.join(HOME, '.config', 'opencode-backups');
const PACK_DIR = path.join(__dirname, '..');

const DIR_MAPPING = {
  '.agents': '.agents',
  '.config': '.config',
  'anthropic-skills': 'skills',
  'github-tools': 'github-tools',
  'scripts': 'scripts',
  'tools': 'tools',
  'tools-v2': 'tools-v2',
  'wordlists': 'wordlists'
};

class Installer {
  constructor() {
    this.manifest = null;
    this.loadManifest();
  }

  loadManifest() {
    const manifestPath = path.join(PACK_DIR, 'manifest.json');
    if (fs.existsSync(manifestPath)) {
      this.manifest = fileUtils.readJSON(manifestPath);
    }
  }

  async install() {
    const startTime = Date.now();
    logger.info('Starting installation...');

    // Create backup first
    await this.backup();

    // Install each directory
    for (const [src, dest] of Object.entries(DIR_MAPPING)) {
      const srcPath = path.join(PACK_DIR, src);
      const destPath = path.join(INSTALL_DIR, dest);

      if (fs.existsSync(srcPath)) {
        logger.info(`Installing ${src}...`);
        fileUtils.copyDir(srcPath, destPath);
        logger.success(`${src} installed`);
      }
    }

    // Install individual files
    const files = ['opencode.json', 'AGENTS.md', '.opencodeignore'];
    for (const file of files) {
      const srcPath = path.join(PACK_DIR, file);
      const destPath = path.join(INSTALL_DIR, file);
      if (fs.existsSync(srcPath)) {
        fs.copyFileSync(srcPath, destPath);
      }
    }

    const duration = ((Date.now() - startTime) / 1000).toFixed(2);
    logger.success(`Installation completed in ${duration}s`);
    this.printSummary();
  }

  async backup() {
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const backupPath = path.join(BACKUP_DIR, `backup-${timestamp}`);

    if (!fs.existsSync(INSTALL_DIR)) {
      logger.warn('No existing installation to backup');
      return;
    }

    logger.info('Creating backup...');
    fs.mkdirSync(backupPath, { recursive: true });
    fileUtils.copyDir(INSTALL_DIR, backupPath);
    logger.success(`Backup created: ${backupPath}`);
  }

  async verify() {
    if (!this.manifest) {
      logger.error('Manifest not found');
      return false;
    }

    let passed = 0;
    let failed = 0;
    const errors = [];

    for (const file of this.manifest.files) {
      const filePath = path.join(INSTALL_DIR, file.path);
      if (fs.existsSync(filePath)) {
        const stat = fs.statSync(filePath);
        if (stat.size === file.size) {
          passed++;
        } else {
          failed++;
          errors.push(`${file.path}: size mismatch`);
        }
      } else {
        failed++;
        errors.push(`${file.path}: missing`);
      }
    }

    logger.info(`Verification: ${passed} passed, ${failed} failed`);
    if (errors.length > 0) {
      errors.forEach(e => logger.error(e));
    }
    return failed === 0;
  }

  async rollback() {
    if (!fs.existsSync(BACKUP_DIR)) {
      logger.error('No backups found');
      return;
    }

    const backups = fs.readdirSync(BACKUP_DIR)
      .filter(b => b.startsWith('backup-'))
      .sort()
      .reverse();

    if (backups.length === 0) {
      logger.error('No backups found');
      return;
    }

    const latestBackup = path.join(BACKUP_DIR, backups[0]);
    logger.info(`Restoring from: ${backups[0]}`);

    fileUtils.removeDir(INSTALL_DIR);
    fileUtils.copyDir(latestBackup, INSTALL_DIR);
    logger.success('Rollback completed');
  }

  async uninstall() {
    logger.info('Uninstalling...');
    fileUtils.removeDir(INSTALL_DIR);
    logger.success('Uninstalled successfully');
  }

  status() {
    if (fs.existsSync(INSTALL_DIR)) {
      const size = fileUtils.getDirSize(INSTALL_DIR);
      logger.info(`Installation: ${INSTALL_DIR}`);
      logger.info(`Size: ${fileUtils.formatBytes(size)}`);
    } else {
      logger.warn('Not installed');
    }

    if (fs.existsSync(BACKUP_DIR)) {
      const backups = fs.readdirSync(BACKUP_DIR).filter(b => b.startsWith('backup-'));
      logger.info(`Backups: ${backups.length}`);
    }
  }

  printSummary() {
    const size = fileUtils.getDirSize(INSTALL_DIR);
    console.log('\n' + '='.repeat(50));
    console.log('Installation Summary');
    console.log('='.repeat(50));
    console.log(`Location: ${INSTALL_DIR}`);
    console.log(`Size: ${fileUtils.formatBytes(size)}`);
    console.log('='.repeat(50) + '\n');
  }
}

module.exports = { Installer };
