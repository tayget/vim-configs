" Minimal vimrc with VSCode-like functionality

" Set basic options
set nocompatible               " Use Vim defaults instead of Vi compatibility
set encoding=utf-8             " Set encoding to UTF-8
set number                     " Show line numbers
set relativenumber             " Show relative line numbers
set cursorline                 " Highlight the current line
set tabstop=4                  " Number of spaces for a tab
set shiftwidth=4               " Indentation width
set expandtab                  " Use spaces instead of tabs
set autoindent                 " Automatically indent new lines
set clipboard=unnamedplus      " Use system clipboard for copy/paste
set wrap                       " Wrap long lines
set scrolloff=8                " Keep 8 lines above/below the cursor
set ignorecase                 " Ignore case when searching
set smartcase                  " Override ignorecase if search has uppercase

" Enable syntax highlighting and colors
syntax on
set termguicolors              " Enable 24-bit colors
colorscheme codedark           " Choose a minimal colorscheme

" File navigation
nnoremap <C-p> :FZF<CR>        
nnoremap <C-b> :NERDTreeToggle<CR> " Toggle file explorer with Ctrl-b

" Auto-completion
set completeopt=menu,menuone,noselect  " Show completion menu
inoremap <C-Space> <C-x><C-o>         " Trigger completion with Ctrl-Space

" Linting and formatting
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8']} " Enable linting
let g:ale_fixers = {'javascript': ['prettier'], 'python': ['black']} " Enable auto-formatting
let g:ale_fix_on_save = 1                " Auto-fix on save

" Plugins (requires vim-plug)
call plug#begin('~/.vim/plugged')

" Plugin manager
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy finder
Plug 'preservim/nerdtree'         " File explorer
Plug 'dense-analysis/ale'         " Linting and fixing
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto-completion and intellisense
Plug 'voldikss/vim-floaterm'      " Terminal toggling plugin
Plug 'ryanoasis/vim-devicons'     " File icons for NERDTree and other plugins

call plug#end()

" Start NERDTree automatically for better navigation
autocmd VimEnter * NERDTree | wincmd p

" Save session state automatically
set sessionoptions+=globals
autocmd VimLeave * mksession! ~/.vim/sessions/default.vim

" Auto-close brackets and quotes in insert mode
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" Enable auto-pairs for all file types (without plugin)
let g:AutoPairsMapChords = 0    " Disable chord mapping for brackets and quotes

" Use Tab to navigate and accept completion in coc.nvim
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"

" Use Shift+Tab to navigate backward through the completion list
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Map Ctrl+t to toggle terminal using vim-floaterm in normal mode
nnoremap <C-t> :FloatermToggle<CR>

" Map Ctrl+t to toggle terminal using vim-floaterm in terminal mode
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>

" Map Ctrl + S to save the current file
nnoremap <C-s> :w<CR>    " Save the file with Ctrl-S in normal mode
inoremap <C-s> <Esc>:w<CR>i    " Save the file with Ctrl-S in insert mode
