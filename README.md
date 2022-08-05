# nvim
My personal configuration files for Neovim.

## Usage
### 1. Install Neovim and related packages
`macOS`:
```
brew install neovim packer ripgrep fd stylua
```

`Linux` / `WSL`:
```
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt update
sudo apt upgrade
sudo apt install neovim packer ripgrep fd-find cargo
cargo install stylua
```
### 2. Import the configuration files
```
git clone https://github.com/jinchuangtw/nvim.git
```

### 3. Build up the editing environment
```
cd nvim/lua
nvim plugins.vim
```
Run `:w` to auto install all the packages (the file will run `:PackerSync`
after saving).
> Done! :100:
