const { Installer } = require('./lib/installer');
const logger = require('./lib/logger');

async function uninstall() {
  logger.info('Running uninstall script...');
  const installer = new Installer();
  await installer.uninstall();
}

uninstall().catch(err => {
  logger.error(`Uninstall failed: ${err.message}`);
  process.exit(1);
});
