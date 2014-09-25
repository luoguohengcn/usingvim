set nocompatible
set history=300
filetype plugin on
filetype indent on

set autoread
set bsdir=buffer

let mapleader=","
let g:mapleader=","

map <leader>e :e! $MYVIMRC<CR>
map <leader>o :e! 
map <leader>cd :cd %:p:h<CR>:pwd<CR>
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

set scrolloff=7
set wildmenu
set ruler
set cmdheight=2

set hidden

set backspace=eol,start,indent
set whichwrap=b,s,<,>

set ignorecase
set smartcase

set hlsearch
set incsearch

set showmatch
set matchtime=5

set number
colorscheme koehler
syntax enable
syntax on

set nobackup
set nowritebackup
set noswapfile

"set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

set autoindent
set smartindent
set cindent
set wrap

try
	set undodir = $VIMRUNTIME/undodir
	set undofile
catch
endtry

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set ffs=unix,dos,mac
set termencoding=cp936
"set fileencoding=cp936

set showtabline=2

"map <LEFT> :tabprev<CR>
"map <RIGHT> :tabnext<CR>
"map <UP> :bprev<CR>
"map <DOWN> :bnext<CR>

"map <F1> :NERDTreeToggle<CR>
"imap <F1> <ESC>:NERDTreeToggle<CR>

map <F3> :tabnew<CR>
map <F4> :bdelete<CR>

map <F9> :set number!<CR>
map <F10> :set wrap!<CR>
map <F11> :set list!<CR>
map <F12> :help<CR>
imap <F12> <ESC>:help<CR>

map <silent> <C-TAB> :tabnext<CR>
map <silent> <S-TAB> :tabprev<CR>
map <silent> <C-RETURN> :bnext<CR>
map <silent> <S-RETURN> :bprev<CR>
map <LEFT> :tabprev<CR>
map <RIGHT> :tabnext<CR>
map <UP> :bprev<CR>
map <DOWN> :bnext<CR>

set laststatus=2
set statusline=%<%f\ [%{getcwd()}] 
" %<%t\ [%{getcwd()}]
set statusline+=\ [%{&ff}\|%{strlen(&fenc)?&fenc:'none'}]
set statusline+=\ %h%m%r
set statusline+=%=%-14.(%c%V\ [0x%B],%l/%LL,[%p%%]%)

"autocmd! filetype java setlocal omnifunc=javacomplete#Complete
"autocmd! bufnew,bufwrite,bufread *.as set filetype=actionscript

let g:highlighting = 0
function! Highlighting()
	if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
		let g:highlighting = 0
		return ":silent nohlsearch\<CR>"
	endif
	let @/ = '\<'.expand('<cword>').'\>'
	let g:highlighting = 1
	return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <SPACE> Highlighting()

if has('gui_running')
	set guioptions-=T 
	set guioptions-=r
	set guioptions+=m
	set guitablabel=%t\ %m%r 
	set guifont=Terminal:h15:w6
	"set columns=84 lines=51

	if has('win32')
		"language messages en_US.UTF-8
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
	endif
endif
