call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mfussenegger/nvim-dap'
Plug 'mxsdev/nvim-dap-vscode-js'
Plug 'microsoft/vscode-js-debug', { 'do': 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out' }
Plug 'David-Kunz/jester'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'adelarsq/vim-matchit'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/sonokai'
Plug 'justinmk/vim-sneak'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
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

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <C-p> <cmd>Telescope git_files<cr>

" Markdown Preview
nmap <C-m><C-p> <Plug>MarkdownPreviewToggle

