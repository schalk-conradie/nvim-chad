# Neovim Configuration

A clean and minimal Neovim configuration.

## Requirements

- Nerd Font
- Treesitter CLI
- Ripgrep
- GCC
- Make

## Installation

### macOS/Linux

1. Clone this repository:

   ```bash
   git clone https://github.com/schalk-conradie/nvim-chad ~/.config/nvim
   ```

2. Open Neovim and let it install plugins automatically

3. Run `:TSUpdate` to install/update tree-sitter parsers

### Windows

#### Prerequisites

Install [Chocolatey](https://chocolatey.org/):

```powershell
# Run in PowerShell as Administrator
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

#### Install Dependencies

Using Chocolatey:

```powershell
# Run in PowerShell as Administrator
choco install git ripgrep make mingw nerd-fonts-firacode llvm
```

#### Install Mise (optional but recommended)

Mise manages language runtimes:

```powershell
# Install mise via winget
winget install jdx.mise

# Or via scoop
scoop install mise

# Add to PowerShell profile
notepad $PROFILE
```

Add to your PowerShell profile:

```powershell
# Mise activation
$misePath = "$env:USERPROFILE\AppData\Local\mise\shims"
if (Test-Path $misePath) {
    $env:PATH = "$misePath;$env:PATH"
}
```

#### Install bob

Bob manages neovim instances

```powershell
mise use rust
cargo install bob-nvim
```

#### Install neovim

Install neovim nightly or 0.12+ using bob

```powershell
bob install nightly|stable|latest|<version-string>|<commit-hash>
```

#### Use a specific neovim version

```powershell
bob use nightly|stable|latest|<version-string>|<commit-hash>
```

#### Install Neovim Configuration

```powershell
# Create config directory if it doesn't exist
mkdir -Force "$env:LOCALAPPDATA\nvim"

# Clone the repository
git clone https://github.com/schalk-conradie/nvim-chad "$env:LOCALAPPDATA\nvim"
```

#### First Run

1. Open Neovim in PowerShell:

   ```powershell
   nvim
   ```

2. Let it install plugins automatically (this may take a few minutes)

3. Install/update tree-sitter parsers:
   ```
   :TSUpdate
   ```

#### Windows-Specific Notes

- Config location: `%LOCALAPPDATA%\nvim\` (usually `C:\Users\<username>\AppData\Local\nvim\`)
- Make sure GCC is in your PATH after installation
- Some plugins may require a terminal with proper Unicode support (Windows Terminal recommended)
