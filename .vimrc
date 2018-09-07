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
" ctrlp plugin
Plugin 'ctrlpvim/ctrlp.vim'
" Solarized Color Scheme
Plugin 'altercation/vim-colors-solarized'
" Surround plugin
Plugin 'tpope/vim-surround'
" NERDTree
Plugin 'scrooloose/nerdtree'
" AG Plugin
Plugin 'rking/ag.vim'
" Completion plugin
Plugin 'Shougo/deoplete.nvim'
" Ruby completion
Plugin 'fishbullet/deoplete-ruby'
" Haskell plugin
Plugin 'neovimhaskell/haskell-vim'
" Vim airline
Plugin 'vim-airline/vim-airline'
" Scala syntax
Plugin 'derekwyatt/vim-scala'
" Idris Support
Plugin 'idris-hackers/idris-vim'

call vundle#end()

"----------------------------------------------------------------
" Personal
"----------------------------------------------------------------
filetype plugin indent on
au BufNewFile,BufRead *.mi set filetype=perl
au BufNewFile,BufRead *.m set filetype=perl

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

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rw'

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ag
let g:ag_prg="/usr/local/bin/ag --vimgrep"
let g:ag_working_path_mode="r"

" deoplete
let g:deoplete#enable_at_startup = 1

" Crontab workaround
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
