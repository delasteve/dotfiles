set nocompatible
filetype off

" Vundle/Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Raimondi/delimitMate'
Plugin 'mhinz/vim-signify'
Plugin 'nanotech/jellybeans.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-lawrencium'

call vundle#end()

syntax on

filetype plugin indent on

set encoding=utf-8

set t_Co=256
if filereadable(expand("$HOME/.vim/bundle/jellybeans.vim/colors/jellybeans.vim"))
  colorscheme jellybeans
endif

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

" Airline Symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigge="<s-tab>"

" Signify
let g:signify_vcs_list = ['git', 'hg']
let g:signify_sign_add = '+'
let g:signify_sign_delete = '-'
let g:signify_sign_change = '~'
highlight SignifySignAdd ctermfg=green
highlight SignifySignDelete ctermfg=red
highlight SignifySignChange ctermfg=yellow
highlight clear SignColumn

set nu
set list
set listchars=tab:»\ ,eol:\ \,trail:·
set autoindent
set copyindent
set nobackup
set noswapfile
set nowrap
set directory=~/.vim/.tmp,~/tmp,/tmp

if has("autocmd")
  filetype on

  autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
endif

