const { Installer } = require('./lib/installer');
const logger = require('./lib/logger');

async function update() {
  logger.info('Updating...');
  const installer = new Installer();
  await installer.install();
}

update().catch(err => {
  logger.error(`Update failed: ${err.message}`);
  process.exit(1);
});
