const { Installer } = require('./lib/installer');
const logger = require('./lib/logger');

async function backup() {
  logger.info('Creating backup...');
  const installer = new Installer();
  await installer.backup();
}

backup().catch(err => {
  logger.error(`Backup failed: ${err.message}`);
  process.exit(1);
});
