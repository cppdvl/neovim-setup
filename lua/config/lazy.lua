local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--depth=1", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Error: Couldn't clone folke/lazy.nvim", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to continue..."},
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- Yo! put lazy in the runtimepath for nvim 
vim.opt.runtimepath:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before loading lazy
-- This made to ensure mapping correctness.
-- Also a good place to setup other stuff
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy nvim
require("lazy").setup({
    spec = {
        { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme "tokyonight" end },
        { "arzg/vim-colors-xcode" },
        { "vim-airline/vim-airline"},
        { "vim-airline/vim-airline-themes"},
        { "cdelledonne/vim-cmake"},
        { "dense-analysis/ale"},
        { "hrsh7th/nvim-cmp"},
        { import = "config.plugins" }
    },
})
