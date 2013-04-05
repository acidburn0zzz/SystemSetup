filetype plugin on
filetype indent on

set history=10000
set autoread
set nocompatible
set ruler
set hidden
set shortmess=atI
set cursorline
set cursorcolumn
set notitle
set paste
set lazyredraw
set scrolloff=4
set background=dark
set cmdheight=2
set laststatus=2

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set wildmenu
set wildmode=list:longest,full

set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set matchtime=2

set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

set nobackup
set nowritebackup
set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

set autoindent
set smartindent

set list
set listchars=trail:∘,tab:᚛\ ,extends:᚜

syntax enable
colorscheme jarvis

function! RestoreCursor()
    if line ("'\"") <= line("$")
    	normal! g`"
	return 1
    endif
endfunction

let mapleader=","

map <leader>d :call <SID>DiffWithDisk()<CR>
map <leader>m :silent! :make \| :redraw! \| :botright :cw<CR>
map <leader>t :TagbarToggle<CR>

nmap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>
nmap <leader>v V`]
nmap <leader><space> :let @/=''<CR>
nmap <leader>vb :ls<CR>:vert sb<space>
nmap <leader>hb :ls<CR>:sb<space>

cabbrev w!! w !sudo tee % > /dev/null

let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkyellow',  'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['brown',       'firebrick3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['yellow',      'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['red',         'firebrick3'],
        \ ]

" autocmd BufWinEnter * call RestoreCursor()
autocmd BufReadPost *.java DetectIndent

