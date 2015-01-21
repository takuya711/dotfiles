"basic settings
set backspace=2
syntax enable


"path settings
if has('win64') || has('win32')
	:set runtimepath+=$HOME/vimfiles,$HOME/vimfiles/after
	:set runtimepath+=$HOME/.vimrc
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


"font settings
if has('win64') || has('win32')
	set guifont=MeiryoKe_Gothic:h11:cSHIFTJIS
endif
set ambiwidth=single


"NeoBundle settings
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible 
  endif

  " Required:
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'dpy-/molokai'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck


"colorscheme settings
colorscheme jellybeans
