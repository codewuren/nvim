"	  __  __         _   _                 _                    
"	 |  \/  |_   _  | \ | | ___  _____   _(_)_ __ ___  _ __ ___ 
"	 | |\/| | | | | |  \| |/ _ \/ _ \ \ / / | '_ ` _ \| '__/ __|
"	 | |  | | |_| | | |\  |  __/ (_) \ V /| | | | | | | | | (__ 
"	 |_|  |_|\__, | |_| \_|\___|\___/ \_/ |_|_| |_| |_|_|  \___|
"					 |___/                                              


" @Author: CodeWuRen (https://github.com/codewuren)
" @Date: 2022.05.07


" -- ------
" -- ------ Install all the plugins when opening it for the first time
" -- ------

if empty(glob('~/.config/nvim/plugged/'))
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green
set list
set listchars=tab:\┆\ ,trail:-
hi CursorLine ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set viewoptions=cursor,folds,slash,unix
set relativenumber
set autoindent
set scrolloff=5

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

""" coc confiuration
let g:coc_global_extensions = ['coc-explorer']
nmap tt <Cmd>CocCommand explorer<CR>
