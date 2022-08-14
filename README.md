# nvim
My personal configuration files for Neovim. (v0.7.2)
> For NVIM v0.8.0-dev, please see the last section in this README file.

## Main Features
* Plugins managing (using `packer`)
* Personal main page for Neovim
* Customized keybinding
* File explorer
* Status bar
* Fuzzy search
* Syntax highlight (using `nvim-treesitter`)
* LSP auto-completion
    * clangd (for `c`, `cpp`, ...)
    * jedi_language_server (for `python`)
    * sumneko_lua (for `lua`)
    * texlab (for `tex`)
* Code formatter (using `null-ls`)
    * `lua`
    * `c`, `cpp`
    * `python`
* Markdown previewer
* LaTeX editor (using `vimtex`)

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

## Include Path Settings for LSP Servers
* `clangd` ([ref.](https://clangd.llvm.org/installation#project-setup))
    * For single project, you could either
        * Manually create a `.clangd` config file in the root of the project.
        * Tell the build tools (ex: `CMake`, `Bazel`, etc.) to generate
        `compile_commands.json`.
    * For user global configuration, manually create a `config.yaml` file in the
    path of `clangd`. For detail, please see [this site](https://clangd.llvm.org/config#files) 
    
    To tell `clangd` where the external libraries locate, you could add this
    code to the config files:
    ```
    CompileFlags:
        Add:
            - "--include-directory={$PATH_OF_SOME_LIBS}"
            - "--include-directory={$PATH_OF_SOME_OTHER_LIBS}"
    ```
## TODO
* Code formatter for 
    * `Markdown`
    * `tex` 
* LaTeX PDF viewer support for `WSL` and `Linux`

## For NVIM v0.8.0-dev
In this version, some APIs had been deprecated hence we need to update them.

In `lua/lsp`, please change
* `resolved_capabilities` to `server_capabilities`
* `document_formatting` to `documentFormattingProvider`
* `document_range_formatting` to `documentRangeFormattingProvider`

For more reference, please see the [issue](https://github.com/neovim/nvim-lspconfig/issues/1891)
