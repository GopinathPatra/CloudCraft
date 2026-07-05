#!/bin/bash

set -e
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

info() {
    echo -e "${BLUE}[INFO]${RESET} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${RESET} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${RESET} $1"
}

error() {
    echo -e "${RED}[ERROR]${RESET} $1"
}

echo "======================================"
echo "   CloudCraft Setup Script"
echo "======================================"
echo "Welcome, $USER"
echo "Today's Date: $(date)"
echo "Current Directory: $(pwd)"


install_package() {
    local package=$1

    info "Checking $package..."

    if command -v "$package" >/dev/null 2>&1
    then
        success "✅ $package is already installed."
    else
        info "Installing $package..."
        sudo apt install -y "$package"

        if command -v "$package" >/dev/null 2>&1
        then
            success "✅ $package installed successfully."
        else
          error "❌ Failed to install $package."
          exit 1
    fi
fi
echo
}
info "Updating package list..."

sudo apt update

success "Package list updated."

echo
PACKAGES=(
    git
    curl
    wget
    vim
    tree
    unzip
)
for pkg in "${PACKAGES[@]}"
do
    install_package "$pkg"
done
echo "========================================="
success "CloudCraft setup completed successfully!"
echo "========================================="