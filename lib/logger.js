const fs = require('fs');
const path = require('path');

const LOG_DIR = path.join(process.env.HOME || '/root', '.config', 'opencode-logs');
const LOG_FILE = path.join(LOG_DIR, 'install.log');

const colors = {
  reset: '\x1b[0m',
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  magenta: '\x1b[35m',
  cyan: '\x1b[36m',
  white: '\x1b[37m'
};

function ensureLogDir() {
  if (!fs.existsSync(LOG_DIR)) {
    fs.mkdirSync(LOG_DIR, { recursive: true });
  }
}

function log(level, message) {
  const timestamp = new Date().toISOString();
  const logLine = `[${timestamp}] [${level}] ${message}\n`;
  
  ensureLogDir();
  fs.appendFileSync(LOG_FILE, logLine);
}

module.exports = {
  info: (msg) => {
    console.log(`${colors.green}[INFO]${colors.reset} ${msg}`);
    log('INFO', msg);
  },
  warn: (msg) => {
    console.log(`${colors.yellow}[WARN]${colors.reset} ${msg}`);
    log('WARN', msg);
  },
  error: (msg) => {
    console.log(`${colors.red}[ERROR]${colors.reset} ${msg}`);
    log('ERROR', msg);
  },
  success: (msg) => {
    console.log(`${colors.green}[SUCCESS]${colors.reset} ${msg}`);
    log('SUCCESS', msg);
  },
  debug: (msg) => {
    if (process.env.DEBUG) {
      console.log(`${colors.cyan}[DEBUG]${colors.reset} ${msg}`);
    }
    log('DEBUG', msg);
  },
  progress: (current, total, item) => {
    const percent = Math.round((current / total) * 100);
    const bar = '█'.repeat(Math.floor(percent / 5)) + '░'.repeat(20 - Math.floor(percent / 5));
    process.stdout.write(`\r${colors.cyan}[${bar}]${colors.reset} ${percent}% - ${item}`);
    if (current === total) console.log('');
  }
};
