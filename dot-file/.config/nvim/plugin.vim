call plug#begin('~/.config/nvim/plugged')

" those look pretty cool, but it doesn't work
" Plug 'nvim-lua/plenary.nvim'
" Plug 'ruifm/gitlinker.nvim'
" Plug 'ekickx/clipboard-image.nvim'
" Plug 'numToStr/Navigator.nvim'

" icon, I want to install but I need to fix font problem first
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'yamatsum/nvim-nonicons'

" more snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'honza/vim-snippets'

" black the inactive window
" Plug 'sunjon/shade.nvim'

Plug 'airblade/vim-gitgutter'
" fix column problem https://www.reddit.com/r/neovim/comments/f04fao/my_biggest_vimneovim_wish_single_width_sign_column/
set signcolumn=yes

Plug 'itchyny/lightline.vim'
set laststatus=2

Plug 'mattn/emmet-vim'

Plug 'scrooloose/nerdtree'
nmap <F5> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif
autocmd FileType nerdtree setlocal signcolumn=no

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'jiangmiao/auto-pairs'
au FileType ejs let b:AutoPairs = AutoPairsDefine({'<%': '%>', '<!--': '-->'})
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--': '-->'})

Plug 'neoclide/coc.nvim', {'branch': 'release'}
so ~/.config/nvim/coc-config.vim

" Plug 'othree/javascript-libraries-syntax.vim'

" Plug 'majutsushi/tagbar'
" nmap <F8> :TagbarToggle<CR>

" markdown
" Plug 'suan/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" 這個設定怪怪的
" Plug 'joker1007/vim-markdown-quote-syntax'
" let g:markdown_quote_syntax_filetypes = {
"         \ "jsx" : {
"         \   "start" : "javascriptreact",
"         \},
"         \ "css" : {
"         \   "start" : "\\%(css\\|scss\\)",
"         \},
"         \ "haml" : {
"         \   "start" : "haml",
"         \},
"   \}

" Plug 'dkarter/bullets.vim'

Plug 'Chiel92/vim-autoformat'
let g:python3_host_prog="/usr/bin/python3"
nmap <leader>f :Autoformat<CR>

Plug 'junegunn/vim-easy-align'
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Plug 'mzlogin/vim-markdown-toc'

Plug 'preservim/nerdcommenter'
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'ejs': { 'left': '<!--','right': '-->' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" docker
Plug 'ekalinin/Dockerfile.vim'

" js / jsx / ts
Plug 'pangloss/vim-javascript'

Plug 'isruslan/vim-es6'

Plug 'maxmellon/vim-jsx-pretty'
" fix jsx tag color for vim-jsx-pretty
hi link jsxPunct Directory
hi link jsxCloseString Directory

Plug 'HerringtonDarkholme/yats.vim'

" css
Plug 'ap/vim-css-color'


" c / cpp
Plug 'bfrg/vim-cpp-modern'

Plug 'mbbill/undotree'
nnoremap <F6> :UndotreeToggle<CR>
autocmd FileType undotree setlocal signcolumn=no

" Plug 'ahw/vim-hooks'

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'cespare/vim-toml', {'for': 'toml'}

" Plug 'lifepillar/vim-colortemplate'

" Plug 'glacambre/firenvim'

Plug 'isobit/vim-caddyfile', {'for': 'caddyfile'}

Plug 'github/copilot.vim'

Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'

Plug 'kevinhwang91/vim-ibus-sw'

" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Plug 'mg979/vim-visual-multi'

Plug 'fatih/vim-go'

" color schemas
Plug 'ericbn/vim-solarized'

call plug#end()
