syntax on
filetype off

call pathogen#infect()
call pathogen#helptags()
call pathogen#incubate()

"Default indenting
set expandtab
set shiftwidth=4
set softtabstop=4
filetype plugin indent on

if has("vms")
  set nobackup                            " do not keep a backup file, use versions instead
else
  set backup                              " keep a backup file
endif

set history=50                            " keep 50 lines of command line history
set hlsearch
set showcmd                               " display incomplete commands
set incsearch                             " do incremental searching
set backspace=indent,eol,start            " allow backspacing over everything in insert mode
if has("gui_macvim")
   win 160 55
   set guifont=DejaVu\ Sans\ Mono:h18
endif
set nocompatible                          " use vim not vi

" Always show statusline
set laststatus=2
set noruler
" Show buffer number, filetype, fileformat and fileencoding in statusline
set statusline=[%n]\ [%f]\ %w%y%r%m[%{&fileformat}][%{&fileencoding}]\ %=\ %l/%L,%-5c\ %P\ 

""""""""""""""""""""""
" filetype settings 
""""""""""""""""""""""
augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

augroup myfiletypes
  autocmd! 
  autocmd FileType ruby,eruby,yaml,coffee set ai sw=2 sts=2 ts=2 et enc=utf8
  "autocmd FileType html,xhtml,css,dust,svg,xml,php,eruby set ai sw=3 sts=3 ts=3 et enc=utf8
  autocmd FileType html,xhtml,css,dust,svg,xml,php,eruby set ai sw=2 sts=2 ts=2 et enc=utf8
  "autocmd FileType html,xhtml,css,dust,svg,xml,php,eruby set ai sw=4 sts=4 ts=4 et enc=utf8
  autocmd FileType javascript set ai sw=2 sts=2 ts=2 et enc=utf8
  "autocmd FileType javascript set ai sw=4 sts=4 ts=4 et enc=utf8
  autocmd FileType dust set ai sw=4 sts=4 ts=4 et enc=utf8
  autocmd FileType html,xhtml,xml,xsl,svg,eruby,php source ~/.vim/bundle/closetag/scripts/closetag.vim
augroup END


"""""""""""""""""""""""
" key mapping
"""""""""""""""""""""""

" block indent
vnoremap < <gv
vnoremap > >gv

" autocompletion on <C-Space>
imap <C-Space> <C-X><C-O>

" duplicate line on <C-d>
imap <C-d> <ESC>yypi

" Fuzzy Finder :FufFile
map <C-f> :FufFile<CR>
imap <C-f> <ESC>:FufFile<CR>

" navigating long lines
map <C-DOWN> gj
map <C-UP> gk
imap <C-UP> <ESC>gki
imap <C-DOWN> <ESC>gji

" don't use Ex mode, use Q for formatting
map Q gq

" OpenURL in firefox
command -bar -nargs=1 OpenURL :!open -a firefox <args>

" hide toolbar
set guioptions-=T

" config zencoding
let g:user_zen_expandabbr_key = '<c-e>'
let g:user_zen_settings = {
\  'scss' : {
\    'extends' : 'css',
\  },
\}

" Highlighting of trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"Next line prevent the reset of highlighting colors by colorscheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" pat
colorscheme wombat
set nofoldenable

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" For using syntastic with standard
let g:syntastic_javascript_checkers = ['standard']
" End syntastic with standard

inoremap jj <ESC>

au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
