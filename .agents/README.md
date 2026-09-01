# Agents Directory
## Sub-agents available

Sub-agents are specialized AI agents that handle specific tasks:

| Sub-agent | Use For |
|-----------|---------|
| python-coder | Code generation |
| python-reviewer | Code review |
| python-tester | Writing tests |
| python-scout | Finding context |

## Usage
```json
{"tool": "task", "args": {"subagent_type": "python-coder", "prompt": "Write code..."}}
```