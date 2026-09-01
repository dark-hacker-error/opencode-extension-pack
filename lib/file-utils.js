const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

module.exports = {
  copyDir: async (src, dest) => {
    const entries = fs.readdirSync(src, { withFileTypes: true });
    fs.mkdirSync(dest, { recursive: true });
    
    for (const entry of entries) {
      const srcPath = path.join(src, entry.name);
      const destPath = path.join(dest, entry.name);
      
      if (entry.isDirectory()) {
        await module.exports.copyDir(srcPath, destPath);
      } else {
        fs.copyFileSync(srcPath, destPath);
      }
    }
  },

  removeDir: (dir) => {
    if (fs.existsSync(dir)) {
      fs.rmSync(dir, { recursive: true, force: true });
    }
  },

  hashFile: (filePath) => {
    const content = fs.readFileSync(filePath);
    return crypto.createHash('md5').update(content).digest('hex');
  },

  walkDir: (dir, fileList = []) => {
    const files = fs.readdirSync(dir);
    files.forEach(file => {
      const filePath = path.join(dir, file);
      const stat = fs.statSync(filePath);
      if (stat.isDirectory()) {
        module.exports.walkDir(filePath, fileList);
      } else {
        fileList.push({
          path: filePath,
          size: stat.size,
          hash: module.exports.hashFile(filePath)
        });
      }
    });
    return fileList;
  },

  getDirSize: (dir) => {
    let size = 0;
    const files = fs.readdirSync(dir);
    files.forEach(file => {
      const filePath = path.join(dir, file);
      const stat = fs.statSync(filePath);
      if (stat.isDirectory()) {
        size += module.exports.getDirSize(filePath);
      } else {
        size += stat.size;
      }
    });
    return size;
  },

  formatBytes: (bytes) => {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
  },

  safeWrite: (filePath, content) => {
    const dir = path.dirname(filePath);
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
    }
    fs.writeFileSync(filePath, content);
  },

  readJSON: (filePath) => {
    return JSON.parse(fs.readFileSync(filePath, 'utf8'));
  },

  writeJSON: (filePath, data) => {
    module.exports.safeWrite(filePath, JSON.stringify(data, null, 2));
  }
};
