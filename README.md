# check

### Prerequisites
    aspell: Spell checker
    xsel: Required for clipboard support (-c flag)

### Installation
```
chmod +x check
mv check ~/.local/bin/  # Or anywhere in your $PATH
```

### Usage
```
check "Hello world"`    # Spell-check a string directly
check FILE              # Spell-check content of a file
check --clipboard       # Spell-check current clipboard content
check --cursor          # Spell-check cursor highlighted text
```

### Options
| Option | Argument | Description |
| :--- | :---: | :--- |
| `--help` | None | Show this help message |
| `--clipboard` | None | Speak text from the clipboard |
| `--cursor` | None | Speak content from a plaintext file |