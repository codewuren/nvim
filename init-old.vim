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
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set number
set hlsearch
highlight Comment ctermfg=green
hi CursorLine ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set viewoptions=cursor,folds,slash,unix
set autoindent
set scrolloff=5

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
call plug#end()

""" coc confiuration
let g:coc_global_extensions = ['coc-explorer', 'coc-json', 'coc-ccls', 'coc-rls', 'coc-pyright']

nmap tt <Cmd>CocCommand explorer<CR>
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
