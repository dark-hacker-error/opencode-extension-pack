# 🎯 OpenCode Extension Pack

> **The Ultimate Hacking Extension Pack for OpenCode**

[![npm version](https://img.shields.io/npm/v/opencode-extension-pack)](https://www.npmjs.com/package/opencode-extension-pack)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 📦 What's Included

| Component | Files | Description |
|-----------|-------|-------------|
| **System Prompts** | 18+ | Full claude-fable-5.md, opus variants, cowork, design, science |
| **Hacking Skills** | 8 | hack, recon, web-attack, brute, exploit, report, master, chat |
| **Scripts** | 20+ | auto-recon, auto-attack, auto-report, monster-attack, self-heal |
| **OSINT APIs** | 56+ | Instagram, Snapchat, Telegram, YouTube, IP, Email, Phone |
| **Wordlists** | 3 | common.txt, web-common.txt, directory-list-medium.txt |
| **Hacking Tools** | 19 | XSStrike, commix, nuclei, sherlock, maigret, strix, etc. |
| **GitHub Tools** | 43 | Full GitHub MCP Server integration |
| **Tools v2** | 15 | Attack prompts, encoding, network, web, payload, report tools |

**Total: 4012 files, 414.18 MB**

---

## 🚀 Quick Start

### Install via npm
```bash
npm install -g opencode-extension-pack
```

### Auto-Install (Recommended)
After npm install, the pack automatically:
1. Backs up existing skills
2. Installs all components to `~/.config/opencode/`
3. Creates `hacker.md` as the default chat agent
4. Installs 56+ OSINT APIs

### Manual Install
```bash
git clone https://github.com/dark-hacker-error/opencode-extension-pack.git
cd opencode-extension-pack
bash install.sh
```

---

## 🔧 CLI Commands

```bash
opencode-pack install       # Full installation
opencode-pack uninstall     # Clean removal
opencode-pack backup        # Create backup
opencode-pack restore       # Restore from backup
opencode-pack verify        # Verify installation
opencode-pack update        # Update to latest
opencode-pack help          # Show help
```

---

## 📁 Directory Structure

```
extension-pack/
├── .agents/           # Sub-agents
├── .config/           # Configuration files
├── anthropic-skills/  # System prompts (389K claude-fable-5.md)
├── github-tools/      # GitHub MCP tools
├── scripts/           # 20+ automation scripts
├── tools/             # 19 hacking tools (115MB)
├── tools-v2/          # Advanced utilities
├── wordlists/         # Password & path lists
└── package.json       # npm package
```

### Installation Mapping
| Source | Destination |
|--------|-------------|
| `.agents/` | `~/.config/opencode/.agents/` |
| `.config/` | `~/.config/opencode/.config/` |
| `anthropic-skills/` | `~/.config/opencode/skills/` |
| `github-tools/` | `~/.config/opencode/github-tools/` |
| `scripts/` | `~/.config/opencode/scripts/` |
| `tools/` | `~/.config/opencode/tools/` |
| `tools-v2/` | `~/.config/opencode/tools-v2/` |
| `wordlists/` | `~/.config/opencode/wordlists/` |

---

## 🛠️ Available Skills

| Skill | Triggers | Purpose |
|-------|----------|---------|
| `hack` | hack, scan, attack, exploit | Hacking commands |
| `recon` | recon, enumerate, scan | Reconnaissance |
| `web-attack` | sql, xss, inject | Web app attacks |
| `brute` | brute, crack, password | Brute force |
| `exploit` | exploit, payload, shell | Exploitation |
| `report` | report, summary, document | Report generation |
| `master` | (auto) | Intent detection & routing |
| `chat` | hello, hi, how are you | Normal conversation |

---

## 📋 OSINT APIs (56+)

| Category | API |
|----------|-----|
| Instagram | Profile, Posts, Stories |
| Snapchat | Profile, Snap Map |
| Telegram | User, Bot, Groups |
| YouTube | Channel, Videos, Comments |
| IP | Geolocation, Reverse DNS |
| Email | Validation, Breach check |
| Phone | Validation, Carrier |
| GitHub | Users, Repos, Gists |

---

## 🔒 Security Notes

- **Backup**: Always backup before installation
- **Verify**: Run `opencode-pack verify` after install
- **Restore**: Use `opencode-pack restore` if issues occur

---

## 📝 License

MIT License - see [LICENSE](LICENSE) for details.

---

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

---

## ⭐ Star History

If this helps you, please star the repository!

---

**Made with ❤️ by dark-hacker-error**