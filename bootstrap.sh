#!/usr/bin/env bash
set -e

echo "🔧 Bootstrapping system dependencies for Neovim..."

# Detect platform
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update
    sudo apt install -y curl git unzip \
        dotnet-sdk-8.0 \
        build-essential \
        ripgrep \
        fd-find
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew update
    brew install git unzip curl \
        dotnet \
        ripgrep \
        fd
else
    echo "Unsupported platform: $OSTYPE"
    exit 1
fi

echo "✅ Dependencies installed."
