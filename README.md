Thank you for providing the repository link! Based on the details of the repository, here’s the updated `README.md` for your repository that includes the correct GitHub URL, installation instructions, key shortcuts, and feature explanations.

---

# Vim Configuration Setup with Features

This repository contains a minimal Vim configuration optimized for a VSCode-like experience. It includes useful plugins for file navigation, auto-completion, linting, and terminal integration. You can quickly set up this environment using the provided installation script.

## Installation

Follow these steps to automatically set up the Vim environment using the provided bash script:

### 1. Clone the Repository

Clone this repository to your local machine (or you can directly download the script if you have the raw file):

```bash
git clone https://github.com/tayget/vim-configs.git
cd vim-configs
```

### 2. Make the Script Executable

Ensure the `setup-vim.sh` script is executable:

```bash
chmod +x setup-vim.sh
```

### 3. Run the Setup Script

Run the setup script to automatically configure Vim, install dependencies, set up the font, and install plugins:

```bash
./setup-vim.sh
```

This script will:
- Detect your system type (Debian-based or Arch-based) and install necessary dependencies.
- Install the Hack font in the `~/.fonts` directory.
- Clone the repository and set up your `.vimrc` configuration.
- Install Vim plugins using `vim-plug`.

### 4. Restart Vim

Once the script finishes, restart Vim to load the new configuration and installed plugins.

---

## Key Shortcuts and Features

Here’s a list of useful key shortcuts that will help you get the most out of this Vim setup:

### General Navigation:
- **Ctrl + p**: Open the FZF fuzzy file finder (allows you to quickly search and open files).
- **Ctrl + b**: Toggle the NERDTree file explorer (useful for navigating directories and opening files).
- **Ctrl + t**: Open/close the terminal window using the `vim-floaterm` plugin.

### Auto-Completion:
- **Ctrl + Space**: Trigger auto-completion in insert mode (using `coc.nvim` for Intellisense).
- **Tab**: Navigate forward in the completion list (works if a completion menu is visible).
- **Shift + Tab**: Navigate backward in the completion list.

### Linting and Formatting:
- **Save file (`:w`)**: Automatically formats the code when you save, based on your configured linters and formatters (e.g., `eslint`, `flake8`, `prettier`, `black`).

### Bracket and Quote Auto-closing:
- **( , [ , { , " , '**: Auto-closes pairs of brackets, quotes, and parentheses** when typed in insert mode.

### Vim Session Management:
- **VimEnter**: Automatically opens NERDTree when Vim starts.
- **VimLeave**: Saves the Vim session automatically to `~/.vim/sessions/default.vim` on exit, so you can resume where you left off.

---

## Features and Functionality

This setup includes several powerful Vim plugins that enhance your workflow:

### 1. **NERDTree** (File Explorer)
NERDTree is a file tree explorer that opens on Vim start. You can toggle it using the shortcut `Ctrl + b`. It allows you to navigate directories and open files efficiently.

- **Toggle NERDTree**: `Ctrl + b`

### 2. **FZF** (Fuzzy File Finder)
The FZF plugin allows you to search for files quickly. Press `Ctrl + p` to invoke the fuzzy search menu, where you can start typing the filename to locate it.

- **Invoke FZF**: `Ctrl + p`

### 3. **coc.nvim** (Auto-Completion and Intellisense)
The `coc.nvim` plugin provides auto-completion, IntelliSense, and linting functionality for various programming languages. It’s highly customizable and works similarly to the autocompletion system found in modern IDEs.

- **Trigger completion**: `Ctrl + Space`

### 4. **ALE (Asynchronous Lint Engine)**
ALE integrates linting and fixing for various languages (e.g., JavaScript, Python). Linting errors and warnings appear as you type, and code can be auto-fixed on save.

- **Auto-format on save**: ALE will automatically fix code on save (based on configured fixers like `black` for Python or `prettier` for JavaScript).

### 5. **vim-floaterm** (Terminal Integration)
`vim-floaterm` allows you to open a terminal window within Vim, which can be used for running commands, scripts, or managing your workflow without leaving the editor.

- **Toggle terminal**: `Ctrl + t`

---

## Additional Configuration

You can always modify the `~/.vimrc` file to further tweak the settings and install additional plugins. For example:
- Change the colorscheme by editing the line `colorscheme codedark` in the `.vimrc`.
- Add new plugins by using `Plug 'plugin-name'` under the `call plug#begin()` section.

---

## Uninstallation

If you ever wish to remove the Vim setup:
1. Delete the `~/.vimrc` file.
2. Remove the `~/.vim` directory.
3. Optionally, uninstall plugins manually or delete the `~/.vim/autoload/plug.vim` file.
4. To uninstall Hack font, simply remove the `~/.fonts/Hack` directory.

---

## License

This Vim configuration is free to use and modify. Feel free to contribute or customize it further!

---

This `README.md` now links directly to your GitHub repository, providing clear instructions on installation, key features, and usage. It also includes information for uninstallation and further customization.
