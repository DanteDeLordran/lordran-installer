#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Yay
install_yay() {
    if command_exists yay; then
        echo "Yay is already installed."
    else
        echo "Installing Yay..."
        git clone https://aur.archlinux.org/yay.git
        cd yay || exit
        makepkg -si --noconfirm
        cd .. && rm -rf yay
    fi
}

# Function to install Python
install_python() {
    echo "Installing Python..."
    sudo pacman -S --noconfirm python
}

# Function to install Rust
install_rust() {
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

# Function to install Bun
install_bun() {
    if command_exists bun; then
        echo "Bun is already installed."
    else
        echo "Installing Bun..."
        curl -fsSL https://bun.sh/install | bash
    fi
}

# Function to install Visual Studio Code
install_vscode() {
    if command_exists code; then
        echo "Visual Studio Code is already installed."
    else
        echo "Installing Visual Studio Code..."
        yay -S --noconfirm visual-studio-code-bin
    fi
}

# Function to install Zen Browser
install_zen_browser() {
    if command_exists zen; then
        echo "Zen Browser is already installed."
    else
        echo "Installing Zen Browser..."
        yay -S --noconfirm zen-browser-bin
    fi
}

# Function to install Minikube
install_minikube() {
    if command_exists minikube; then
        echo "Minikube is already installed."
    else
        echo "Installing Minikube..."
        sudo pacman -S --noconfirm minikube
    fi
}

# Function to install Steam
install_steam() {
    if command_exists steam; then
        echo "Steam is already installed."
    else
        echo "Installing Steam..."
        sudo pacman -S --noconfirm steam
    fi
}

# Function to update the system and install basic tools
update_system() {
    echo "Updating system..."
    sudo pacman -Syu --noconfirm
    echo "Installing basic tools..."
    sudo pacman -S --noconfirm curl zip unzip git base-devel
}

# Main function
main() {
    update_system
    install_yay
    install_python
    install_rust
    install_bun
    install_vscode
    install_zen_browser
    install_minikube
    install_steam
    echo "Setup complete!"
}

# Execute the main function
main
