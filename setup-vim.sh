#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to detect the system type (Arch or Debian)
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    else
        echo "unknown"
    fi
}

# Update system and install dependencies based on distribution
install_dependencies() {
    DISTRO=$(detect_distro)

    case "$DISTRO" in
        ubuntu|debian)
            echo "Detected Debian-based system. Installing dependencies..."
            sudo apt update
            sudo apt install -y vim curl git fontconfig wget unzip
            ;;
        arch|manjaro)
            echo "Detected Arch-based system. Installing dependencies..."
            sudo pacman -Syu --noconfirm
            sudo pacman -S --noconfirm vim curl git fontconfig wget unzip
            ;;
        *)
            echo "Unsupported distribution: $DISTRO"
            exit 1
            ;;
    esac
}

# Install Hack font if not installed
install_hack_font() {
    FONT_DIR="$HOME/.fonts"
    FONT_URL="https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip"
    FONT_ZIP="$HOME/Hack-font.zip"

    # Check if Hack font is already installed
    if [ ! -d "$FONT_DIR/Hack" ]; then
        echo "Installing Hack font..."
        wget -q "$FONT_URL" -O "$FONT_ZIP"
        unzip -q "$FONT_ZIP" -d "$FONT_DIR"
        rm "$FONT_ZIP"
        fc-cache -fv
    else
        echo "Hack font is already installed."
    fi
}

# Install vim-plug (plugin manager for Vim)
install_vim_plug() {
    if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
        echo "Installing vim-plug..."
        curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        echo "vim-plug is already installed."
    fi
}

# Clone your GitHub repository and set up .vimrc
setup_vim_config() {
    # Replace with your actual repository URL
    REPO_URL="https://github.com/your-username/your-repo-name.git"
    VIM_CONFIG_DIR="$HOME/.vim"

    echo "Cloning your GitHub repository..."
    git clone "$REPO_URL" "$VIM_CONFIG_DIR"

    echo "Moving .vimrc to the home directory..."
    cp "$VIM_CONFIG_DIR/.vimrc" "$HOME/.vimrc"
}

# Install Vim plugins
install_vim_plugins() {
    echo "Installing Vim plugins..."
    vim +PlugInstall +qall
}

# Main setup function
main() {
    # Install dependencies based on system type
    install_dependencies

    # Install Hack font
    install_hack_font

    # Set up Vim configuration
    setup_vim_config

    # Install vim-plug (if not already installed)
    install_vim_plug

    # Install Vim plugins
    install_vim_plugins

    # Confirm success
    echo "Vim setup complete!"
}

# Run the main function
main

