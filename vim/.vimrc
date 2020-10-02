" display line number
set nu

" set encoding
set encoding=utf-8

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

" enable clipboard
set clipboard=unnamed

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

call plug#begin('~/vim/plugged')
	Plug 'arcticicestudio/nord-vim'
	Plug 'scrooloose/nerdtree'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-syntastic/syntastic'
	Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
	Plug 'vim-scripts/indentpython.vim'
	Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
call plug#end()

colorscheme nord

"split navigations
nnoremap <C-K> <C-W><C-J>
nnoremap <C-J> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open new split panes to right and below
set splitbelow
set splitright

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

" Enable code folding
set foldmethod=indent
set foldlevel=99
" Space to fold/unfold
noremap <space> za

" PEP8 indentation
au BufNewFile,BufRead *.py;
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Web indentation
au BufNewFile,BufRead *.js, *.html, *.css;
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Flag unnecessary white space
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YCM configuration
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF
