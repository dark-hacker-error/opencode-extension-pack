const { Installer } = require('./lib/installer');
const logger = require('./lib/logger');

async function verify() {
  logger.info('Verifying installation...');
  const installer = new Installer();
  const valid = await installer.verify();
  process.exit(valid ? 0 : 1);
}

verify().catch(err => {
  logger.error(`Verification failed: ${err.message}`);
  process.exit(1);
});
