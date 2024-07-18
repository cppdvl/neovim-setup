:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set expandtab
:set noswapfile
:set mouse=a

call plug#begin() 

Plug 'git@github.com:airblade/vim-gitgutter'
Plug 'git@github.com:mfussenegger/nvim-lint'
Plug 'git@github.com:williamboman/mason.nvim'
Plug 'git@github.com:williamboman/mason-lspconfig.nvim'
Plug 'git@github.com:neovim/nvim-lspconfig'
Plug 'git@github.com:nvim-lua/plenary.nvim'
Plug 'git@github.com:nvim-telescope/telescope.nvim'
Plug 'git@github.com:lunacookie/vim-colors-xcode.git'
Plug 'git@github.com:vim-airline/vim-airline.git'
Plug 'git@github.com:vim-airline/vim-airline-themes.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'cdelledonne/vim-cmake'
Plug 'Shougo/deoplete.nvim'
Plug 'ncm2/float-preview.nvim'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'w0rp/ale'
Plug 'liuchengxu/vim-clap'
Plug 'Olical/conjure', { 'tag' : 'v4.3.1' }
Plug 'folke/tokyonight.nvim'

call plug#end()

"deoplete stuff
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
set completeopt-=preview

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40	

"ale stuff
let g:ale_linterns = { 'clojure' : ['clj-kondo', 'joker'] }

"clap stuff
let g:clap_provider_grep_delay = 50
let g:clap_provider_grep_opts = '-M --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
nnoremap <leader>* :Clap grep ++query=<cword><cr>
nnoremap <leader>fg :Clap grep<cr>
nnoremap <leader>ff :Clap files --hidden<cr>
nnoremap <leader>fb :Clap buffers<cr>
nnoremap <leader>fw :Clap windows<cr>
nnoremap <leader>fr :Clap history<cr>
nnoremap <leader>fh :Clap command_history<cr>
nnoremap <leader>fj :Clap jumps<cr>
nnoremap <leader>fl :Clap blines<cr>
nnoremap <leader>fL :Clap lines<cr>
nnoremap <leader>ft :Clap filetypes<cr>
nnoremap <leader>fm :Clap marks<cr>



nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>

let g:cmake_link_compile_commands = 1

