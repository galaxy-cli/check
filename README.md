# check

Interactively spell-check and correct text from the terminal using `aspell`.

## Features

- **Multiple input sources:** Spell-check a single-line prompt (submit with `Enter`), multi-line manual input (`-l` / `--long`, submit with `Ctrl+D`), a literal text argument, a plaintext file (`-f` / `--file`), piped `stdin`, or the system clipboard (`-c` / `--clipboard`).
- **Clipboard round-trip:** When checking from the clipboard (`-c`), writes the corrected text back to the clipboard automatically.
- **Optional auto-named output:** Save corrected text into a target directory (`-o` / `--output`) while preserving source filenames for file input or generating collision-safe slug + timestamp names for other inputs.
- **Contextual dependency checks:** Checks only the tools required for the selected mode (`aspell`, plus `xsel` for clipboard or `file` for file validation).

## Requirements

- **Bash** (`#!/usr/bin/env bash`)
- **`aspell`** (required for all modes)
- **`xsel`** (required when using `-c` / `--clipboard`)
- **`file`** (required when using `-f` / `--file`)

On Debian/Ubuntu systems:

```bash
sudo apt install aspell xsel file
```

## Installation

Copy `check` into a directory on your `PATH` and make it executable:

```bash
chmod +x check
sudo cp check /usr/local/bin/check
```

## Usage

```text
Usage: check [OPTION]... [TEXT]
```

### Options

| Flag | Description |
| :--- | :--- |
| `-c`, `--clipboard` | Spell-check text directly from the system clipboard and write the result back |
| `-f`, `--file=FILE` | Spell-check text from a specified plaintext file |
| `-l`, `--long` | Use multi-line manual input mode (submit with `Ctrl+D`) |
| `-o`, `--output=DIR` | Save the corrected text into `DIR` with an automatic filename |
| `--help` | Display usage information and exit |
| `-v`, `--version` | Display version information and exit |

### Examples

Single-line manual input (press `Enter` to submit):

```bash
check
```

Multi-line manual input (press `Ctrl+D` to submit):

```bash
check -l
```

Spell-check a literal string:

```bash
check "teh quick brwn fox"
```

Spell-check a file and save the result to a directory:

```bash
check -f notes.txt -o ~/Documents/corrected
```

Spell-check from the clipboard:

```bash
check -c
```

Spell-check piped `stdin` while keeping interactive `aspell` prompts on `/dev/tty`:

```bash
printf "recieveing messges\n" | check
```

## Output Naming & Safety

- Temporary workspaces are created via `mktemp` under `${TMPDIR:-/tmp}` and cleaned up on exit, `SIGINT`, or `SIGTERM`.
- When `-o` / `--output` is provided:
  - **File input** reuses the source file's basename.
  - **Non-file input** builds a slug from the first ~6 words of the pre-edit text plus a `YYYYMMDD-HHMMSS` timestamp and `.txt` extension.
  - Existing target paths are not overwritten; conflicting names receive a numeric suffix (`_2`, `_3`, and so on).

## License & Project

- **Repository:** <https://github.com/galaxy-cli/check>
- **Issues:** <https://github.com/galaxy-cli/check/issues>