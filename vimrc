set nocompatible

let mapleader = ','

" Show ines number
set number

" Bottom line. Shows status bar
set ruler
syntax on

" Default Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Convert tabs to spaces
set expandtab

" Wrapping text by default
set wrap
set linebreak

" Searching and highlights
set hlsearch
set incsearch
set ignorecase
set smartcase

" Use space to remove highlighting of found text
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

" Keep more content at the bottom of the buffer
set scrolloff=5

" Highlight cursor line
set cursorline

" Tab completion
set wildmenu
set wildmode=list:longest,list:full

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
" filetype plugin indent on --- this is my normal option
" and this one is only for Vundle
filetype off

" Directories for swp files
set backupdir=~/dotvim/vim_backups//
set directory=~/dotvim/vim_backups//
set viewdir=~/dotvim/vim_backups//

" Show (partial) command in the status line
set showcmd

set hidden

set history=1000

" ========================================================================
"  MAPPINGS
" ========================================================================
" Better ESC
inoremap <C-F> <ESC>
inoremap <C-c> <ESC>

" ========================================================================
" VIM TERMINAL
" ========================================================================

" 256 colors for terminal vim
set t_Co=256

" Making cursor a bar in insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set paste

" Vundle init
set rtp+=~/dotvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' 
Plugin 'bling/vim-airline'
Plugin 'endwise.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rakr/vim-one'

call vundle#end()

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

  
" execute pathogen#infect()
filetype plugin indent on
colorscheme one
set background=dark
