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
let g:syntastic_html_tidy_ignore_errors= ["proprietary attribute \"autofocus", "proprietary attribute \"ui-", "proprietary attribute \"ng-", "<form> proprietary attribute \"novalidate\"", "<form> lacks \"action\" attribute", "trimming empty <span>", "<input> proprietary attribute \"autofocus\"", "inserting implicit <span>", "<input> proprietary attribute \"required\"", "trimming empty <select>", "trimming empty <button>", "<html> proprietary attribute \"app\"", "proprietary attribute \"autocomplete\"", "trimming empty <i>", "proprietary attribute \"required\"", "proprietary attribute \"placeholder\"", "<ng-include> is not recognized!", "discarding unexpected <ng-include>", "missing </button>", "replacing unexpected button by </button>", "discarding unexpected </ng-include>"]

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

function! CustomFoldText()
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile

  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = ' '
  let foldtextstart = strpart(line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=CustomFoldText()

au FileType javascript call JavaScriptFold()

if has("autocmd")
  filetype on

  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview

  " Defaults should editorconfig not be used
  autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType zsh setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md set spell
endif
