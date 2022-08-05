# nvim
My personal configuration files for Neovim. (versions must >= 0.7.0)

## Main Features
* Plugins managing (using `packer`)
* Personal main page for Neovim
* Customized keybinding
* File explorer
* Status bar
* Fuzzy search
* Syntax highlight (using `nvim-treesitter`)
* LSP auto-completion
    * clangd (for `c`, `cpp`, `object-c`, ...)
    * sumneko_lua (for `lua`)
* Code formatter (using `stylua`)
    * lua
* Markdown previewer

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

## TODO
* LSP for
    * tex
    * python
    * markdown
* Code formatter for 
    * c-languages
    * python
    * markdown
* Fixing the bugs for `vimtex`
