# check

A minimalist, interactive CLI spell-checker that uses the `aspell` engine to rapidly check and correct text from terminal strings, files, or your system clipboard.

### Prerequisites

- **aspell**: The underlying spell-checking utility
- **xsel**: Required for clipboard support (`-c` flag)

You can install these dependencies on Debian/Ubuntu systems via:
```bash
sudo apt update && sudo apt install aspell xsel
```

### Installation

Give the script execution permissions and move it into your local binary directory:

```bash
chmod +x check
mv check ~/.local/bin/          # Or anywhere else in your $PATH
```

### Usage

```bash
check                          # Prompt mode: type text directly and press ENTER
check "hello wrld"             # String mode: spell-check literal text characters directly
check hello.txt                # String mode: spell-check the literal word "hello.txt"
check -f hello.txt             # File mode: extract and spell-check the text inside the file
check -c                       # Clipboard mode: spell-check text currently in your clipboard
```

### Options


| Option | Argument | Description |
| :--- | :---: | :--- |
| `-c, --clipboard` | None | Spell-check text directly from the system clipboard |
| `-f, --file`      | `FILE` | Extract and spell-check text from a specified plaintext FILE |
| `--help`          | None | Show help message and exit |
| `-v, --version`   | None | Output version information and exit |