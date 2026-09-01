#!/usr/bin/env node

const { Installer } = require('../lib/installer');
const logger = require('../lib/logger');
const path = require('path');
const fs = require('fs');

const args = process.argv.slice(2);
const command = args[0];

const installer = new Installer();

async function main() {
  try {
    switch (command) {
      case 'install':
        logger.info('Installing OpenCode Extension Pack...');
        await installer.install();
        break;

      case 'verify':
        logger.info('Verifying installation...');
        const valid = await installer.verify();
        process.exit(valid ? 0 : 1);
        break;

      case 'backup':
        logger.info('Creating backup...');
        await installer.backup();
        break;

      case 'rollback':
        logger.info('Rolling back...');
        await installer.rollback();
        break;

      case 'update':
        logger.info('Updating...');
        await installer.update();
        break;

      case 'uninstall':
        logger.info('Uninstalling...');
        await installer.uninstall();
        break;

      case 'status':
        installer.status();
        break;

      case 'help':
      default:
        showHelp();
        break;
    }
  } catch (error) {
    logger.error(`Error: ${error.message}`);
    process.exit(1);
  }
}

function showHelp() {
  console.log(`
OpenCode Extension Pack v1.0.0

Usage: opencode-pack <command>

Commands:
  install    Install all files to ~/.config/opencode/
  verify     Verify installation integrity
  backup     Create timestamped backup
  rollback   Restore from backup
  update     Update to latest version
  uninstall  Remove all installed files
  status     Show installation status
  help       Show this help message

Examples:
  opencode-pack install
  opencode-pack verify
  opencode-pack backup
  opencode-pack rollback
  opencode-pack uninstall
`);
}

main();
