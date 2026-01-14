#!/bin/bash

set -e

echo "=== Neovim Config Installation ==="

# Определяем ОС
if [ -f /etc/arch-release ]; then
    OS="arch"
elif [ -f /etc/debian_version ]; then
    OS="debian"
else
    echo "Unsupported OS"
    exit 1
fi

echo "Detected OS: $OS"

# Установка зависимостей
if [ "$OS" = "arch" ]; then
    echo "Installing dependencies for Arch..."
    sudo pacman -S --needed neovim git ripgrep fd npm python-pynvim xclip ttf-jetbrains-mono-nerd

elif [ "$OS" = "debian" ]; then
    echo "Installing dependencies for Ubuntu/Debian..."
    sudo apt update
    sudo apt install -y git ripgrep fd-find npm python3-pynvim xclip
    
    # Симлинк для fd
    if [ ! -f /usr/local/bin/fd ]; then
        sudo ln -s $(which fdfind) /usr/local/bin/fd
    fi
    
    # Свежий Neovim
    if ! command -v nvim &> /dev/null || [[ $(nvim --version | head -1 | cut -d' ' -f2 | cut -d'.' -f2) -lt 10 ]]; then
        echo "Installing latest Neovim..."
        sudo add-apt-repository -y ppa:neovim-ppa/unstable
        sudo apt update
        sudo apt install -y neovim
    fi
    
    echo ""
    echo "=== IMPORTANT: Install Nerd Font on Windows ==="
    echo "Download from: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
    echo "Install the font and set it in Windows Terminal settings"
    echo ""
fi

echo "Installation complete! Run 'nvim' to start."
echo "Plugins will install automatically on first launch."
