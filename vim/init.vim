call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'adelarsq/vim-matchit'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/sonokai'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" General
inoremap jk <ESC>
cnoremap <C-a> <C-b>
cnoremap <A-b> <S-Left>
cnoremap <A-f> <S-Right>
cnoremap <A-h> <Left>
cnoremap <A-l> <Right>
vnoremap . :norm.<CR>
set relativenumber
set hlsearch
set incsearch
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Theme
let g:sonokai_style = 'shusia'
colorscheme sonokai

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>
