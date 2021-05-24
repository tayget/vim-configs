"Color Scheme

"Vscode Theme
"colorscheme codedark

"Gruvbox Themme
colorscheme gruvbox
set background=dark

"Dracula Theme
"colorscheme dracula

autocmd VimEnter * hi Normal ctermbg=none

"Add Line Number
set number

"Nerd Tree Directory Configs

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p 

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Show Terminal at Bottom
set splitbelow



" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

"Plugins --vim-plug
call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Install fuzzy finder binaryPlug 'junegunn/fzf.vim'  
Plug 'editorconfig/editorconfig-vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelisense
Plug 'dart-lang/dart-vim-plugin' "dart snippets
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'itmammoth/doorboy.vim'
call plug#end()


"Emmet Key
let g:user_emmet_leader_key=','

"Set Prettier Path
"let g:prettier#exec_cmd_path = "/home/sarosx/node_modules/.bin/prettier"


"Coc Extensions
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-phpls',
    \ 'coc-python',
    \ 'coc-diagnostic'
    \]

let g:auto_save = 1  " enable AutoSave on Vim startup

set cursorline
