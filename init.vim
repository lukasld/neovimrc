set nocompatible
set number
filetype off

" Use vidir command to bulk rename
" Plugs
" Plug 'morhetz/gruvbox'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#begin('~/.config/nvim/plugged')


" Timeout value
set timeoutlen=500
" Set leader
let mapleader = ","
" Set scrolling to True
:set mouse=a

"Syntax
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Theme
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'trapd00r/vidir'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'fatih/vim-go'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"Telescope
Plug 'sharkdp/fd'

"Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"Vim-Marks-update
Plug 'chentoast/marks.nvim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1

call plug#end()
" Custom Keybinding
inoremap jj <esc>
inoremap jk <esc>

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

":help telescope.builtin let g:python3_host_prog='/usr/bin/python3'
let g:python3_host_prog='/opt/homebrew/bin/python3'
let g:syntastic_python_checkers = ['flake8']
" let g:python_host_prog='/usr/bin/python'

" set spacing
set ts=4 sw=4

" Tabs
set expandtab

" Colorscheme
colorscheme gruvbox
" colorscheme tokyonight

" for the dev-icons to appear in nerdtree
set encoding=UTF-8

" Telescope
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>

" Makes marks visible
" calling lua code
lua << EOF
require'marks'.setup {
	default_mappings = true,
	signs = true,
	mappings = {}
}
EOF

" Treesitter enable
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Semshi update
function MyCustomHighlights()
	" 231 -> white
	hi semshiLocal           ctermfg=209 guifg=#ffffff
	hi semshiGlobal          ctermfg=188 guifg=#ffffff
	hi semshiImported        ctermfg=214 guifg=#ffffff cterm=bold gui=bold
	hi semshiParameter       ctermfg=111 guifg=#ffffff
	hi semshiParameterUnused ctermfg=226 guifg=#ffffff cterm=underline gui=underline
	hi semshiFree            ctermfg=243 guifg=#ffffff
	hi semshiBuiltin         ctermfg=46  guifg=#ffffff
	hi semshiAttribute       ctermfg=42  guifg=#ffffff
	hi semshiSelf            ctermfg=247 guifg=#ffffff
	hi semshiUnresolved      ctermfg=209 guifg=#ffffff cterm=underline gui=underline
	hi semshiSelected        ctermfg=209 guifg=#ffffff ctermbg=161 guibg=#d7005f
endfunction
autocmd FileType python call MyCustomHighlights()
