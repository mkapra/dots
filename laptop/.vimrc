" ▄▄   ▄▄ ▄▄▄▄▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄▄ ▄▄  ▄▄▄▄▄▄▄    ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄▄
" █  █▄█  █      █   ▄  █ █       █  ██       █  █  █ █  █   █  █▄█  █   ▄  █ █       █
" █       █  ▄   █  █ █ █ █       █▄▄██  ▄▄▄▄▄█  █  █▄█  █   █       █  █ █ █ █       █
" █       █ █▄█  █   █▄▄█▄█     ▄▄█   █ █▄▄▄▄▄   █       █   █       █   █▄▄█▄█     ▄▄█
" █       █      █    ▄▄  █    █      █▄▄▄▄▄  █  █       █   █       █    ▄▄  █    █
" █ ██▄██ █  ▄   █   █  █ █    █▄▄     ▄▄▄▄▄█ █   █     ██   █ ██▄██ █   █  █ █    █▄▄
" █▄█   █▄█▄█ █▄▄█▄▄▄█  █▄█▄▄▄▄▄▄▄█   █▄▄▄▄▄▄▄█    █▄▄▄█ █▄▄▄█▄█   █▄█▄▄▄█  █▄█▄▄▄▄▄▄▄█
"

let mapleader = "\<Space>"

" ============================== Plugins
call plug#begin()

Plug 'altercation/vim-colors-solarized' " Colorscheme

Plug 'tpope/vim-sleuth' " Automatic intendations

Plug 'jiangmiao/auto-pairs' " Pair Completion

if executable("fzf")
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
endif

if has ("nvim")
endif

call plug#end()

" ============================== Colors
syntax on
set background=dark
colorscheme solarized
hi Normal ctermbg=NONE guibg=NONE
filetype indent plugin on

" ============================== General
set number
set relativenumber
set cursorline
set ruler

set showmatch " highlights paranthesis
set laststatus=0 " remove status bar
set mat=5
set noswapfile " can be problematic on some systems
set confirm " can't quit without saving
set noshowmode " don't show mode in status
set noshowcmd " don't show command in status
set encoding=utf-8
set mouse=c " a=on, c=off
set undolevels=1337
set backspace=indent,eol,start
set wildmenu " autocomplete :e
set scrolloff=7 " min lines aboive or below the cursor

" ============================== Indents and Whitespaces
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

autocmd FileType perl set tabstop=8 shiftwidth=4 softtabstop=4

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" ============================== Search
set incsearch
set ignorecase
set smartcase " case sensitive when capital letters are used
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
nmap <C-f> :Files<CR>

" ============================== Snippets
iab lbf \textbf{}<LEFT>
iab lframe \begin{frame}{}<CR><CR>\end{frame}<UP>
iab litem \begin{itemize}<CR><CR>\end{itemize}<UP>
iab ltable \begin{tabular}{}<CR>\end{tabular}<UP><RIGHT><RIGHT><RIGHT>
iab lfig \begin{figure}<CR>\includegraphics[width=1\textwidth]{}<CR>\caption{}<CR>\label{figure:}<CR>\end{figure}