"----------------------------------------------------------------
" Vundle 
"----------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Command-T plugin
Plugin 'wincent/command-t'
" Solarized Color Scheme
Plugin 'altercation/vim-colors-solarized'
" Surround plugin
Plugin 'tpope/vim-surround'
" NERDTree
Plugin 'scrooloose/nerdtree'

call vundle#end()

"----------------------------------------------------------------
" Personal
"----------------------------------------------------------------
filetype plugin indent on

" enhances the % command to move between more than just matching [{( depending
" on the filetype
" runtime macros/matchit.vim

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set encoding=utf-8 
set wildmode=longest,list,full
set wildmenu

" Standard remaps
inoremap jk <ESC>
vnoremap . :norm.<CR>

" Settings for seach
set hlsearch
set incsearch

" Backspace
set backspace=indent,eol,start

" Line number settings
set number
set relativenumber
function! ToggleLineNumbers()
    if &relativenumber
        set relativenumber&
    else
        set relativenumber
    endif
endfunction
nnoremap <LEADER># :call ToggleLineNumbers()<CR>

set hidden

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

