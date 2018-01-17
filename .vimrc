"-------------Vim Settings--------------"
set tabstop=2                     "tab spacing
set softtabstop=0                 "unify
set expandtab                     "use spaces instead of tabs
set shiftwidth=1									"indent/outdent by x columns
set smarttab 											"use tabs at start of line, spaces elsewhere
set nowrap												"don't wrap text
set relativenumber
set number
set mouse=a
set backspace=indent,eol,start
syntax on
set ignorecase            " Make searches case-insensitive.

"disable automatic comment insertion
"HOW?!

"Save with cmd+s
:map <D-s> :w<kEnter>  
:imap <D-s> <Esc>:w<kEnter>i 

"F9 runs Python file
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
let mapleader=","


"-------------Plugins--------------"
"type ':PlugInstall' to install plugins. Using VimPlug
call plug#begin() 
  Plug 'mxw/vim-jsx' 
  Plug 'KeitaNakamura/neodark.vim', { 'as': 'neodark' }
  Plug 'joshdick/onedark.vim', { 'as': 'onedark' }
  Plug 'easymotion/vim-easymotion'
  Plug 'Raimondi/delimitMate'
  Plug 'sheerun/vim-polyglot'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
  Plug 'kien/ctrlp.vim'
  Plug 'metakirby5/codi.vim' 
  Plug 'Valloric/YouCompleteMe' 
call plug#end()

"-------------Plugin Settings--------------"
"EasyMotion Settings
nmap <Space> <Plug>(easymotion-overwin-w)
hi link EasyMotionTarget Search
hi link EasyMotionShade  Normal

"NerdTREE Settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
nnoremap f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1

"tComment Settings
vmap gcc gc

"ctrlP settings
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$', 
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

"YCM Settings
let g:ycm_autoclose_preview_window_after_completion=1

"-------------Visuals--------------"
let g:onedark_termcolors=16
let g:onedark_terminal_italics=1

colorscheme onedark

"italics goes after colorscheme
highlight Comment cterm=italic
