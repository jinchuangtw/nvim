require("basic")
require("keybindings")
require("plugins")
require("colorscheme")
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("plugin-config.indent-blankline")
require("lsp.formatter")

-- include path settings
local function path_settings()
    vim.cmd([[ 
        set path=.,/usr/include/,,     
    ]])
end
path_settings()


-- vimtex-related settings
require("plugin-config.vimtex")
local function vimtex_settings()
	vim.cmd([[
        let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'

        " This adds a callback hook that updates Skim after compilation
        let g:vimtex_compiler_callback_hooks = ['UpdateSkim']

        function! UpdateSkim(status)
            if !a:status | return | endif

            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']

            if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
            endif

            if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction
    ]])
end
vimtex_settings()
