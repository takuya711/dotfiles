"NeoBundle settings
if !1 | finish | endif

if has('vim_starting')
	if &compatible
		set nocompatible 
	endif
	
    "Required
    if has('win64') || has('win32')
        set runtimepath+=~/vimfiles/bundle/neobundle.vim/
    elseif has('unix')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
endif

" Required:
call neobundle#begin(expand('~/vimfiles/bundle/'))

"Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/emmet-vim'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck


"colorscheme settings
colorscheme jellybeans

"basic settings
set backspace=2
syntax enable

if has('win64') || has('win32')
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
	set guioptions-=b
endif

"indent settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set foldmethod=indent

if expand("%:t") =~ ".*\py"
	set expandtab
	set tabstop=4
	set shiftwidth=4
endif

if expand("%:t") =~ ".*\html"
	set expandtab
	set tabstop=4
	set shiftwidth=4
endif

if expand("%:t") =~ ".*\css"
	set expandtab
	set tabstop=4
	set shiftwidth=4
endif

"path and shell settings
if has('win64') || has('win32')
	set runtimepath+=$HOME/vimfiles,$HOME/vimfiles/after
	set runtimepath+=$HOME/.vimrc
"	set shell=powershell
"	set shellcmdflag=-command
endif

"encoding
set encoding=utf-8
set fileencoding=utf-8
if has('win64') || has('win32')
	set fileencodings=utf-8,cp932
	"set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
elseif has('unix')
	set fileencodings=utf-8
endif

"Shortcuts
nnoremap <F2> :NERDTreeToggle<CR>

"font settings
if has('win64') || has('win32')
	set guifont=MeiryoKe_Gothic:h11:cSHIFTJIS
endif
set ambiwidth=single
