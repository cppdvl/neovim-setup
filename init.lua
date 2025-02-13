-- Set options
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.mouse = "a"

require("config.lazy")
vim.lsp.set_log_level("debug")

-- Configurations
vim.keymap.set("n", "<space>cc", ":e ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<space>ccc", ":e ~/.config/nvim/lua/config/lazy.lua<CR>")
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Press \ti to toggle the indentation mode
vim.keymap.set("n", "<leader>ti", function()
	if vim.bo.tabstop == 2 then
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.softtabstop = 4
		vim.bo.expandtab = true -- use space instead of tabs
		print("switched to 4-space identation")
	else
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = true -- use space instead of tabs
		print("switched to 2-space identation")
	end
end, { desc = "Toggle indentation and expandtab" })

require("config.cmake.cmake")

-- Ultra Reset
vim.keymap.set("n", "<space> RRRR", ":bufdo bwipeout!<CR>")

-- Initialize packer.nvim
-- require('packer').startup(function()
--   use 'airblade/vim-gitgutter'
--   use 'williamboman/mason.nvim'
--   use 'williamboman/mason-lspconfig.nvim'
--   use 'neovim/nvim-lspconfig'
--   use 'arzg/vim-colors-xcode'
--   use 'vim-airline/vim-airline'
--   use 'vim-airline/vim-airline-themes'
--   use { 'neoclide/coc.nvim', branch = 'release' }
--   use 'antoinemadec/FixCursorHold.nvim'
--   use 'cdelledonne/vim-cmake'
--   use 'Shougo/deoplete.nvim'
--   use 'ncm2/float-preview.nvim'
--   use 'guns/vim-sexp'
--   use 'tpope/vim-sexp-mappings-for-regular-people'
--   use 'w0rp/ale'
--   use 'liuchengxu/vim-clap'
--   use { 'Olical/conjure', tag = 'v4.3.1' }
--   use 'folke/tokyonight.nvim'
-- end)

-- require('config.plugins.telescope')

--vim.g.ale_enabled = 0
--
----python3
--vim.g.python3_host_prog = '/Users/julianguarin/.pyenv/shims/python3'
--
---- Deoplete settings
--vim.g['deoplete#enable_at_startup'] = 1
--
---- Delay deoplete custom settings until the plugin is loaded
--vim.api.nvim_create_autocmd('User', {
--    pattern = 'DeopleteInitPost',
--    callback = function()
--        vim.call('deoplete#custom#option', 'keyword_patterns', { clojure = '[\\w!$%&*+/:<=>?@\\^_~\\-\\.]*' })
--    end
--})
--vim.opt.completeopt:remove('preview')
--
---- vim-airline settings
--vim.g['airline#extensions#tabline#enabled'] = 1
--vim.g['airline#extensions#tabline#buffer_nr_show'] = 1
--
---- Float-preview settings
--vim.g.float_preview_docked = 0
--vim.g.float_preview_max_width = 80
--vim.g.float_preview_max_height = 40
--
---- ALE settings
--vim.g.ale_linters = { clojure = { 'clj-kondo', 'joker' } }
--
---- Clap settings
--vim.g.clap_provider_grep_delay = 50
--vim.g.clap_provider_grep_opts = '-M --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
--
---- Key mappings for Clap
--vim.api.nvim_set_keymap('n', '<leader>*', ':Clap grep ++query=<cword><CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fg', ':Clap grep<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>ff', ':Clap files --hidden<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fb', ':Clap buffers<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fw', ':Clap windows<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fr', ':Clap history<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fh', ':Clap command_history<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fj', ':Clap jumps<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fl', ':Clap blines<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fL', ':Clap lines<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>ft', ':Clap filetypes<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fm', ':Clap marks<CR>', { noremap = true, silent = true })
--
---- CMake key mappings
--vim.api.nvim_set_keymap('n', '<leader>cg', ':CMakeGenerate<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>cb', ':CMakeBuild<CR>', { noremap = true, silent = true })
--
---- Copilot colors
--vim.api.nvim_create_autocmd('ColorScheme', {
--    pattern = '*',
--    command = 'highlight CopilotSuggestion guifg=#00ff00 guibg=NONE'
--})
--vim.cmd('highlight CopilotSuggestion guifg=#00ff00 guibg=NONE')
--vim.cmd([[
--    autocmd FileType cpp,cc,c CocDisable
--    ]])
--
----set color schem tokyonight
---- vim.cmd('colorscheme tokyonight-moon')
--
---- CMake settings
--vim.g.cmake_link_compile_commands = 1
