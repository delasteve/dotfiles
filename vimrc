set nocompatible
filetype off

" Vundle
if filereadable(expand("~/.dotfiles/vim/vundles.vim"))
  source ~/.dotfiles/vim/vundles.vim
endif

" Syntax highlighting
syntax on

" Encoding
set encoding=utf-8

" Color scheme
set t_Co=256
if filereadable(expand("~/.vim/bundle/jellybeans.vim/colors/jellybeans.vim"))
  colorscheme jellybeans
endif

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

let g:airline_left_sep='»'
let g:airline_left_sep='▶'
let g:airline#extensions#tabline#left_sep='▶'
let g:airline_right_sep='◀'
let g:airline_symbols.linenr='␊'
let g:airline_symbols.linenr='¶'
let g:airline_symbols.branch='⎇'
let g:airline_symbols.paste='ρ'
let g:airline_symbols.paste='Þ'
let g:airline_symbols.paste='∥'
let g:airline_symbols.whitespace='Ξ'

" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
highlight SyntasticErrorSign ctermfg=red
highlight SyntasticWarningSign ctermfg=yellow
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_ignore_errors = ['trimming empty <span>', 'proprietary attribute "ng-']

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigge="<s-tab>"

" Signify
let g:signify_vcs_list=['git', 'hg']
let g:signify_sign_add='+'
let g:signify_sign_delete='-'
let g:signify_sign_change='~'
highlight SignifySignAdd ctermfg=green
highlight SignifySignDelete ctermfg=red
highlight SignifySignChange ctermfg=yellow
highlight clear SignColumn

" Autoindent
set autoindent
" Show line numbers
set nu
" Autoreload files
set autoread
" Yank and paste with the system clipboard
set clipboard=unnamed
" Highlight current line
set cul
" Show invisible characters
set list
" Set invisible characters to symbols
set listchars=tab:»\ ,trail:·
" Do not make a backup when overwriting a file
set nobackup
set nowritebackup
" Don't wrap lines
set nowrap
" No swap files
set noswapfile
" If we have a swap file, put it here.
set directory=~/.vim/.tmp,~/tmp,/tmp
" Show a navigable menu for tab completion
set wildmenu
" splitting feels more natural
set splitbelow
set splitright
set backspace=indent,eol,start

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if has("autocmd")
  filetype on

  " Defaults should editorconfig not be used
  autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType zsh setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md set spell
endif
