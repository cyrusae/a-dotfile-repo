# Tmux Configuration

That directory contains a portable tmux configuration designed to work across macOS, Arch Linux, and Ubuntu with Wayland or X11.

> This is a Claude Haiku job and will be updated as I go.

## Structure

```text
.config/tmux/
├── tmux.conf              # Universal config (all platforms)
├── tmux.conf.macos        # macOS-specific (pbcopy/pbpaste)
├── tmux.conf.linux        # Linux-specific (wl-copy for Wayland, xclip for X11)
└── README.md              # This file (Actually in repo root so that it doesn't get unnecessarily symlinked)
```

## Key Features

- **Modal keybindings** via `tmux-zellij-shortcut` plugin
  - `Ctrl+p` for pane operations
  - `Ctrl+t` for tab/window operations
  - `Esc` to exit mode
  - Status bar always shows available keys

- **Mouse support**
  - Click to select panes
  - Scroll with mousewheel
  - **Drag to select text, release to auto-copy to system clipboard**
  - Click and drag pane borders to resize

- **Copy/paste**
  - Mouse drag + release auto-copies to clipboard
  - Can also use `Ctrl+b [` to enter copy mode, then `v` to select, `y` to copy
  - `Ctrl+b P` to paste from tmux buffer
  - `Shift+click` still works to bypass tmux and select natively

- **Colors**
  - Catppuccin mocha theme (matches your starship prompt)
  - Visible pane borders with theme colors

- **Per-platform clipboard**
  - **macOS**: Uses `pbcopy`/`pbpaste`
  - **Linux + Wayland**: Uses `wl-copy` (installed by default on most wayland-enabled distros)
  - **Linux + X11**: Uses `xclip`

## Installation

### With GNU Stow (recommended):

```bash
cd ~/a-dotfile-repo
stow tmux
```

This creates symlinks:

- `~/.config/tmux/tmux.conf` → `~/a-dotfile-repo/tmux/.config/tmux/tmux.conf`
- etc.

### Manual installation:

```bash
mkdir -p ~/.config/tmux
cp .config/tmux/* ~/.config/tmux/
```

## First Run

1. Start tmux:

   ```bash
   tmux
   ```

2. Install plugins (inside tmux):

   ```
   Ctrl+b I  (capital I)
   ```
   
   This downloads `tmux-plugins/tpm`, `catppuccin/tmux`, and `nyanko3141592/tmux-zellij-shortcut`

3. Reload config:

   ```
   Ctrl+b : source-file ~/.config/tmux/tmux.conf
   ```

4. Try the modal keybindings:
   - Press `Ctrl+p` and you'll see the status bar change to show pane options
   - Press `n` to split a pane right, `d` to split down
   - Press `Esc` to exit pane mode

## Usage Tips

### Copy/Paste Workflow

**Mouse-based (easiest):**

1. Select text by clicking and dragging
2. Release the mouse button
3. Text is automatically in your system clipboard
4. Paste with `Cmd+V` (Mac) or `Ctrl+V` (Linux) in any app

**Keyboard-based (for learning):**

1. `Ctrl+b [` to enter copy mode
2. `v` to start selection, navigate with hjkl or arrow keys
3. `y` to copy to clipboard
4. `Ctrl+b P` to paste back into tmux (or `Cmd+V` / `Ctrl+V` in other apps)

**Escape hatch:**

- Hold `Shift` while selecting with the mouse to bypass tmux and use native terminal selection

### Navigation

**Panes (Ctrl+p mode):**

- `n` / `d` - split right / split down
- `x` - close pane
- `hjkl` / arrow keys - move between panes
- `r` - enter resize mode (hjkl/arrows to resize)
- `Esc` - exit pane mode

**Tabs/Windows (Ctrl+t mode):**

- `n` - new window
- `x` - close window
- `hjkl` / arrow keys - switch windows
- `Esc` - exit window mode

(Full keymap available once you're in each mode—status bar shows them)

## Troubleshooting

### Plugins not installing?

Make sure `~/.tmux/plugins/tpm` exists. If not:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then reload tmux and press `Ctrl+b I` to install plugins.

### Copy to clipboard not working?

**macOS:** `pbcopy` is built-in, should work automatically.

**Linux + Wayland:** Make sure `wl-clipboard` is installed:

```bash
# Arch
sudo pacman -S wl-clipboard

# Ubuntu/Debian
sudo apt install wl-clipboard

# Fedora
sudo dnf install wl-clipboard
```

**Linux + X11:** Make sure `xclip` is installed:

```bash
# Arch
sudo pacman -S xclip

# Ubuntu/Debian
sudo apt install xclip

# Fedora
sudo dnf install xclip
```

### Colors not showing?

Make sure your terminal supports 256 colors. Check:

```bash
echo $TERM
```

Should output something like `xterm-256color` or `screen-256color`. If not, you may need to configure your terminal emulator.

## Configuration Notes

- The main `tmux.conf` loads OS-specific files automatically using `if-shell`
- The `COLORTERM=truecolor` in your `.zshrc` helps with color support in tmux
- The `STARSHIP_FORCE_COLORS=1` env var ensures starship prompt colors work inside tmux
- Escape time is set to 50ms for responsive `Esc` key handling (important in vim + tmux)

## Next Steps (Optional)

Once you're comfortable with the basics:

- Learn more copy-mode keybindings for complex selections
- Explore the zellij-shortcut plugin's additional modes (session switching, search, etc.)
- Customize the status bar appearance (currently using catppuccin defaults)
- Create tmux hooks for project-specific window layouts (advanced)

## Resources

- [tmux manual](https://man.openbsd.org/tmux)
- [Catppuccin tmux plugin](https://github.com/catppuccin/tmux)
- [tmux-zellij-shortcut plugin](https://github.com/nyanko3141592/tmux-zellij-shortcut)
- [Tmux Copy & Paste in 2024](https://www.seanh.cc/2020/12/27/copy-and-paste-in-tmux/)