const { Installer } = require('./lib/installer');
const logger = require('./lib/logger');

async function rollback() {
  logger.info('Rolling back...');
  const installer = new Installer();
  await installer.rollback();
}

rollback().catch(err => {
  logger.error(`Rollback failed: ${err.message}`);
  process.exit(1);
});
