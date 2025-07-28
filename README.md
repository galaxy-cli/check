# check

A simple and fast **terminal-based spell checker** utility leveraging [`aspell`](https://aspell.net/) for spelling correction and [`xsel`](https://github.com/kfish/xsel) for clipboard and X11 primary selection integration.

---

## Features

- Spell-check and correct text input directly from the terminal
- Supports input from multiple sources:
  - Interactive typed input from the user
  - File passed as an argument
  - Clipboard content (`--clip` flag)
  - Highlighted text under the mouse cursor / X11 primary selection (`--cursor` flag)
- Automatic dependency check and prompt to install missing tools on Debian-based systems (`aspell` and `xsel`)
- Temporary file handling with automatic cleanup

---

## Dependencies

- [`aspell`](https://aspell.net/) — for spell-check and correction
- [`xsel`](https://github.com/kfish/xsel) — to access clipboard and X11 primary selection
- `bash`, standard Linux utilities

The script will check for these dependencies on launch and offer to install missing packages automatically on Debian/Ubuntu systems via `apt-get`.

### Manual Installation on Debian/Ubuntu
```
sudo apt-get update
sudo apt-get install -y aspell xsel
```

---

## Usage

`check [FILE | --clip | --cursor]`

### Arguments and Flags

| Argument / Flag | Description                                                                              |
| --------------- | ---------------------------------------------------------------------------------------- |
| `FILE`          | Spell-check the contents of the specified file                                          |
| `--clip`        | Spell-check text currently in the system clipboard (accessed via `xsel --clipboard`)     |
| `--cursor`      | Spell-check text currently highlighted/selected in X11 primary selection (via `xsel --primary`) |
| *(no argument)* | Spell-check text entered interactively via the terminal prompt                           |
| `--help`        | Display the usage information                                                           |

---

### Examples

- Spell-check text typed interactively:

`check`

- Spell-check the contents of a file:

`check document.txt`

text

- Spell-check the clipboard contents:

`check --clip`

text

- Spell-check the currently highlighted text in X11 primary selection:

`check --cursor`

---

## How It Works

1. The script verifies that `aspell` and `xsel` are installed and prompts for installation if missing (Debian-based systems only).
2. Depending on the input method (file, clipboard, cursor selection, or interactive), it loads the text into a temporary file.
3. Displays the original text under a `----- BEFORE -----` heading.
4. Runs `aspell -c` on the temporary file, launching an interactive correction interface.
5. After correction, prints the updated text under a `----- AFTER ------` heading.
6. Temporary files are cleaned up automatically.

---

## Notes

- Clipboard and cursor options rely on `xsel` and assume an X11 environment.
- The corrected output is displayed in the terminal but not written back to files or clipboard.
- For Wayland systems, `xsel` might not work; consider alternative clipboard utilities.
- The script uses `set -e` to halt on errors for robustness.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Author & Contact

**galaxy-cli**

GitHub: [https://github.com/galaxy-cli/check](https://github.com/galaxy-cli/check)
