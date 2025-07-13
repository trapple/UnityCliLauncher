# UnityCliLauncher

A shell script that automatically detects the Unity version of a given project and launches the correct Unity editor. Useful in multi-version development environments.

## Installation

1. Copy the script to your preferred location:

For zsh:
```bash
cp bin/unity.sh ~/.zsh/unity.sh
chmod +x ~/.zsh/unity.sh
```

For bash:
```bash
cp bin/unity.sh ~/.local/bin/unity.sh
chmod +x ~/.local/bin/unity.sh
```

2. Add alias to your shell configuration:

For zsh (`.zshrc`):
```bash
alias unity='~/.zsh/unity.sh'
```

For bash (`.bashrc` or `.bash_profile`):
```bash
alias unity='~/.local/bin/unity.sh'
```

3. Reload your shell configuration:
```bash
exec $SHELL -l
```

## Usage

```bash
unity <project_path>
```

## How it works

1. Reads `ProjectSettings/ProjectVersion.txt` from the specified project
2. Extracts Unity version from `m_EditorVersion` field
3. Searches for the corresponding Unity version in `/Applications/Unity/Hub/Editor/`
4. Launches the Unity editor with the specified project

## Requirements

- macOS
- Unity installed via Unity Hub (standard path)

## Compatibility

- sh
- zsh
- bash
