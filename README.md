# check

A minimalist, interactive CLI spell-checker that uses the `aspell` engine to rapidly check and correct text from terminal strings, files, or your system clipboard.

### Prerequisites

- **aspell**: The underlying spell-checking utility
- **xsel**: Required for clipboard support (`-c` flag)
- **file**: Required for file-type validation (`-f` flag)

You don't need to install these up front -- `check` checks for whichever ones a given run actually needs and offers to install them via `apt` on the spot. To install everything ahead of time instead:
```bash
sudo apt update && sudo apt install aspell xsel file
```

### Installation

Give the script execution permissions and move it into your local binary directory:

```bash
chmod +x check
mv check ~/.local/bin/          # Or anywhere else in your $PATH
```

### Usage

```bash
check                               # Prompt mode: type text directly and press ENTER
check "hello wrld"                  # String mode: spell-check literal text characters directly
check hello.txt                     # String mode: spell-check the literal word "hello.txt"
check -f hello.txt                  # File mode: extract and spell-check the text inside the file
check -c                            # Clipboard mode: spell-check text currently in your clipboard
check -o ~/Documents "hello wrld"   # Spell-check a string and save the corrected result
```

> [!NOTE]
> A bare trailing string absorbs everything after it (so literal text containing dashes doesn't get mistaken for flags). That means flags like `-o` need to come **before** the string, not after -- `check -o ~/Documents "text"` works, `check "text" -o ~/Documents` will swallow `-o ~/Documents` into the text instead.

### Saving corrected text

By default, corrections are shown on screen but not saved anywhere -- once the script exits, they're gone. Add `-o DIR` to also write the corrected result into a directory, auto-named:
- **File input** reuses the source name, extension included: `check -f notes.txt -o ~/Documents` → `~/Documents/notes.txt`
- **Clipboard/string/prompt input** has no natural name to borrow, so it's named from a slug of the first few words plus a timestamp: `check "hello wrld" -o ~/Documents` → something like `~/Documents/hello-wrld_20260607-153012.txt`

If a file of that name already exists, a numeric suffix (`_2`, `_3`, ...) is added automatically rather than overwriting it.

### Options

| Option | Argument | Description |
| :--- | :---: | :--- |
| `-c, --clipboard` | None | Spell-check text directly from the system clipboard |
| `-f, --file`      | `FILE` | Extract and spell-check text from a specified plaintext FILE |
| `-o, --output`    | `DIR` | Also save the corrected text into DIR (auto-named, see above) |
| `--help`          | None | Show help message and exit |
| `-v, --version`   | None | Output version information and exit |
