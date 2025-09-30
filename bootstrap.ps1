Write-Host "🔧 Bootstrapping Neovim dependencies..."

# Function to check if a command exists
function Test-Command {
    param([string]$cmd)
    $null -ne (Get-Command $cmd -ErrorAction SilentlyContinue)
}

# Install dotnet via winget if not found
if (-not (Test-Command "dotnet")) {
    Write-Host "Installing .NET SDK..."
    winget install --id Microsoft.DotNet.SDK.8 --source winget -e
} else {
    Write-Host "✅ dotnet already installed."
}

# Install ripgrep
if (-not (Test-Command "rg")) {
    Write-Host "Installing ripgrep..."
    winget install --id BurntSushi.ripgrep.MSVC --source winget -e
} else {
    Write-Host "✅ ripgrep already installed."
}

# Install fd
if (-not (Test-Command "fd")) {
    Write-Host "Installing fd..."
    winget install --id sharkdp.fd --source winget -e
} else {
    Write-Host "✅ fd already installed."
}

Write-Host "🎉 All dependencies installed."
