" Author: ----- {{{
" smurfd aka Nicklas Boman vimrc
" 20180728
" }}}
" Folding: ----- {{{
  set foldenable
  set foldmethod=marker
  set foldlevelstart=0

  " toggle folds
  noremap <Leader><space> za
  noremap <Leader><space> za

  " zO recursive open fold
  noremap zO zczO

  " fold tag
  noremap <Leader>ft Vatzf
" }}}

" VundleBegin: ----- {{{
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin() 
" }}}
" VundlePlugins: ----- {{{
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'ayu-theme/ayu-vim'
  Plugin 'Yggdroot/indentLine'

  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'
  Plugin 'kien/ctrlp.vim'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  Plugin 'tpope/vim-vinegar'
  "Plugin 'valloric/youcompleteme'

  "Plugin 'itchyny/lightline.vim'
" }}}
" VundleEnd: ----- {{{
  call vundle#end()            
  filetype plugin indent on    
" }}}

" LookAndFeel: ----- {{{
  set termguicolors

  let ayucolor="light"
  colorscheme ayu

  set autoindent
  set copyindent
  set preserveindent
  set nosmartindent
  set nocindent
" }}}

" IndentLine: ----- {{{
  "let g:indentLine_setColors = 0
  let g:indentLine_char = '|'
  let g:indentLine_enabled = 1
  let g:indentLine_first_char = '|'
  let g:indentLine_showFirstIndentLevel = 1
  let g:indentLine_concealcursor = 'inc'
  let g:indentLine_conceallevel = 2
  let g:indentLine_color_term = 239
" }}}
" SpecialCharacters: ----- {{{
  set list
  set listchars=tab:——,trail:·,space:·,nbsp:·,eol:¬,extends:⇢,precedes:⇠
  set showbreak=↪\ 
" }}}

" TabHandling: ----- {{{
  set expandtab "spaces instead of tabs
  set tabstop=2
  set shiftwidth=2
  set conceallevel=1
" }}}

" TerminalSettings: ----- {{{
  set termguicolors
  behave mswin
  syntax on
  
  " for vundle
  set nocompatible
  filetype off

  " change leader
  let mapleader=','
  let maplocalleader='\'
 
  " linenumbers 
  set number
  setlocal number
  set ruler

  " terminal fixings
  set backspace=2
  set notimeout
  set ttimeout
  set ttimeoutlen=10

  set nowrap

  set esckeys
  set encoding=utf-8 nobomb
  set binary

  " turn backups off
  set nobackup
  set nowb
  set noswapfile
  set nowritebackup
  set noundofile

"  set laststatus=2
"  set mouse=a

  set autoread
  set showcmd

  set scrolloff=3
  set modeline
" }}}

" Searching: ----- {{{
  set showmatch
  set incsearch
  set hlsearch
  set ignorecase
" }}}

" Airline: ----- {{{
  let g:airline_theme='soda'
  "let g:airline#extensions#tabline#enabled = 1

  "let g:airline#extensions#tabline#left_sep = ' '
  "let g:airline#extensions#tabline#left_alt_sep = '|'

  "let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" }}}

" GUIBegin: ----- {{{
  if has("gui_running")
    set lines=50
    set columns=100
    set synmaxcol=300
    set cursorline

    set guioptions-=T
    set guioptions+=e
    set t_Co=256

    set guifont=Meslo\ LG\ M\ Regular\ 9

		syntax on
" }}}

" GUINetRW: ----- {{{
    let g:netrw_liststyle=3         " thin (change to 3 for tree)
    let g:netrw_banner=1            " no banner
    "let g:netrw_altv=1              " open files on right
    "let g:netrw_preview=1           " open previews vertically
    "let g:netrw_browse_split=2
    "let g:netrw_winsize = 25

	" sane splitting
	set splitbelow            " hsplits below by default
	set splitright            " vsplits right by default
	au VimResized * :wincmd = " Resize splits when the window is resize


    "augroup ProjectDrawer
    "  autocmd!
    "  autocmd VimEnter * :Vexplore
    "augroup END
" }}}
" GUIMisc: ----- {{{
    set autoindent
    set smartindent
" }}}
" GUIEnd: ----- {{{
  endif
" }}}
