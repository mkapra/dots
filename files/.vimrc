 "        __     _
 "       / /    (_)
 "      / /_   ___ _ __ ___  _ __ ___
 "     / /\ \ / / | '_ ` _ \| '__/ __|
 "  _ / /  \ V /| | | | | | | | | (__
 " (_)_/    \_/ |_|_| |_| |_|_|  \___|
 "
 " ~ M. Thomas

let mapleader = "\<Space>"

" ============================== vim-plug
call plug#begin()

Plug 'joshdick/onedark.vim' " color scheme

Plug 'tpope/vim-sleuth' " heuristic file indendation

Plug 'jiangmiao/auto-pairs' " pair completion

Plug 'airblade/vim-gitgutter' " show git changes

Plug 'itchyny/lightline.vim' " bar
Plug 'mengelbrecht/lightline-bufferline' " bufferline
Plug 'ryanoasis/vim-devicons' " icons in bar

if executable("fzf") " fzf support and bindings
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
endif

if has ("nvim")
    Plug 'neovim/nvim-lspconfig' " lsp
    Plug 'Shougo/neosnippet.vim' " snippet support
    Plug 'Shougo/neosnippet-snippets' " actual snippets
    Plug 'nvim-lua/completion-nvim' " autocomplete
    Plug 'liuchengxu/vista.vim' " tags
endif

call plug#end()

" ============================== Colors
syntax on
set background=dark
colorscheme onedark
hi Normal ctermbg=NONE guibg=NONE
set termguicolors

" ============================== General
filetype indent plugin on
set number
set relativenumber
set cursorline
set ruler

set showmatch " highlights paranthesis
set mat=5
set colorcolumn=1337
set noswapfile " can be problematic on some systems
set confirm " can't quit without saving
set noshowmode " don't show mode in status
set noshowcmd " don't show command in status
set encoding=utf-8
set mouse=a " a=on, c=off
set undolevels=1337
set backspace=indent,eol,start
set wildmenu " autocomplete :e
set scrolloff=5 " min lines above or below the cursor

" ============================== Statusline
set laststatus=2
set showtabline=2

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

function! FileNameWithIcon() abort
  return winwidth(0) > 70  ?  WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:T') : ''
endfunction

let g:lightline = { 'colorscheme': 'one' }

let g:lightline.component_function = { 'gitstatus': 'GitStatus' }
let g:lightline.component = { 'filename_with_icon': '%{FileNameWithIcon()}' }

let g:lightline.active = {
      \ 'left': [['mode', 'readonly'], ['filename_with_icon', 'modified']],
      \ 'right': [['lineinfo'], ['percent'], ['gitstatus', 'fileformat', 'fileencoding', 'filetype']]
      \ }

let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.separator = { 'left': '', 'right': '' }

" bufferline
let g:lightline.tabline = {'left': [['buffers']]}
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#auto_hide = 0
let g:lightline#bufferline#enable_devicons = 0
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" ============================== Indents and Whitespaces
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set fillchars+=vert:\  "draw verticle split

autocmd FileType perl set tabstop=8 shiftwidth=4 softtabstop=4

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" ============================== Search
set incsearch " incremental search
set ignorecase " ignore case
set smartcase "  -> unless capitol letters
set hlsearch " highlight all results
nnoremap<leader><space> :nohlsearch<CR>

" ============================== Cursor Thiccness
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" ============================== netrw
let g:netrw_winsize = 25
let g:netrw_liststyle = 3 " Tree-like structure
let g:netrw_banner = 0 " Remove useless banner at the top of netrw

" ============================== Macros and Mappings
cmap Wq wq
cmap Q q
cmap W w
cmap q1 q!

" fzf
nmap <leader>ff :Files<CR>
nmap <leader>ft :tabe<CR>:Files<CR>

" vista tags
nmap <leader>v :Vista finder fzf:vim_lsp<CR>

" ============================== Cool NeoVim Shit
if has ("nvim")
    " setup lsp configs
    lua require'marc.lsp'

    lua require'marc.completion'
endif
