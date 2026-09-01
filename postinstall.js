const { Installer } = require('./lib/installer');
const logger = require('./lib/logger');

async function postinstall() {
  logger.info('Running postinstall script...');
  const installer = new Installer();
  await installer.install();
}

postinstall().catch(err => {
  logger.error(`Postinstall failed: ${err.message}`);
  process.exit(1);
});
