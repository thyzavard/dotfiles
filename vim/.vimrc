set nu

" enable syntax highlighting
syntax on

" automatically indent lines (default)
set noautoindent

" select case-insenitiv search (not default)
set ignorecase

" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" changes special characters in search patterns (default)
set magic

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

call plug#begin('~/vim/plugged')
	Plug 'arcticicestudio/nord-vim'
call plug#end()

colorscheme nord
