# OpenCode Extension Pack

> Complete extension pack for OpenCode with custom agents, skills, tools, scripts, configurations, and wordlists. One command installation with backup, rollback, and verification.

## Features

- **One-Click Install** - Single `npm install` command sets up everything
- **Auto Backup** - Creates timestamped backups before every install/update
- **Rollback** - Restore to any previous version instantly
- **Verification** - Check installation integrity against manifest
- **CLI Manager** - Full command-line interface for managing the pack
- **Cross-Platform** - Works on Termux, Linux, macOS

## What's Included

| Directory | Files | Description |
|-----------|-------|-------------|
| `.agents/` | Custom agent definitions, skills, and plugin configurations |
| `.config/` | OpenCode configurations, node modules, and settings |
| `anthropic-skills/` | All system prompts (Claude Fable 5, Opus 5, Opus 4.x, etc.) |
| `github-tools/` | GitHub integration and automation tools |
| `scripts/` | Custom automation scripts (monster-attack, auto-recon, etc.) |
| `tools/` | Hacking tools collection (nmap, sqlmap, XSStrike, nuclei, etc.) |
| `tools-v2/` | Advanced tools v2 (APIs, encoding, web security, payloads) |
| `wordlists/` | Password and directory wordlists for brute forcing |

## Requirements

- **Node.js** >= 14.0.0
- **npm** >= 6.0.0
- **Git** (for cloning)
- **Python** (for some tools)
- **Termux** or **Linux** environment

## Installation

```bash
# Clone the repository
git clone https://github.com/dark-hacker-error/opencode-extension-pack.git

# Navigate to directory
cd opencode-extension-pack

# Install globally
npm install -g .
```

## CLI Commands

```bash
opencode-pack install    # Install all files
opencode-pack verify     # Verify installation
opencode-pack backup     # Create backup
opencode-pack rollback   # Restore from backup
opencode-pack update     # Update to latest
opencode-pack uninstall  # Remove all files
opencode-pack status     # Show status
opencode-pack help       # Show help
```

## Installation Paths

Files are installed to `~/.config/opencode/`:

```
~/.config/opencode/
├── .agents/
├── .config/
├── skills/          (from anthropic-skills)
├── github-tools/
├── scripts/
├── tools/
├── tools-v2/
└── wordlists/
```

## Backup & Rollback

```bash
# List available backups
ls ~/.config/opencode-backups/

# Restore from backup
opencode-pack rollback
```

## License

MIT