" display line number
set nu

" enable mouse 
"set mouse=a

" enable syntax highlighting
let python_highlight_all=1
syntax on

" automatically indent lines (default)
set autoindent

" select case-insenitiv search (not default)
set ignorecase

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

call plug#begin('~/vim/plugged')
	Plug 'arcticicestudio/nord-vim'
	Plug 'scrooloose/nerdtree'
	Plug 'kien/ctrlp.vim'
	Plug 'vim-syntastic/syntastic'
	Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
call plug#end()

colorscheme nord

"split navigations
nnoremap <C-K> <C-W><C-J>
nnoremap <C-J> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTree configuration
map <C-n> :NERDTreeToggle<CR>
map <C-o> :NERDTreeToggle %<CR>
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set t_Co=256

" Visual search
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
