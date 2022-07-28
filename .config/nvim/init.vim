" =====================
" => PLUGIN MANAGEMENT
" =====================

" Checks for vim-plug and installs it it doesn't exist
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Install the plugins
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
	Plug 'kien/ctrlp.vim'
	Plug 'morhetz/gruvbox'
	Plug 'plasticboy/vim-markdown'
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-unimpaired'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-syntastic/syntastic'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'cdelledonne/vim-cmake'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'mzlogin/vim-markdown-toc'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'radenling/vim-dispatch-neovim'
  Plug 'romgrk/barbar.nvim'
  Plug 'ryanoasis/vim-devicons'
call plug#end()
"
" ===================
" => COC PACKAGES
" ===================

" CocInstall coc-clangd
" CocInstall coc-json
" CocInstall coc-sh
" CocInstall coc-pyright
" CocInstall coc-css
" CocInstall coc-html
" CocInstall coc-markdownlint
" npm install -g dockerfile-language-server-nodejs
" npm install -g graphql-language-service-cli
" npm install -g sql-language-server
" pip install cmake-language-server
" luarocks install --server=http://luarocks.org/dev lua-lsp

" ===================
" => GENERAL CONFIG
" ===================

" Line history size
set history=1024

" Enable filetype plugins
filetype plugin on
filetype indent on

" File auto-reload on external change
set autoread

" Make space the leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Fast save with Leader<w>
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Autosave on Change
" autocmd TextChanged,TextChangedI <buffer> silent write

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
set termguicolors
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" =====================
" => User Interface 
" =====================

" Set 7 lines to the cursor - when moving vertically using j/k
" set so=7

" Turn on the Wild Menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Always show current position
set ruler

"Always show line numbers
set nu

"Always show highlight cursor line
set cursorline

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=5

" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500
"
" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif  

" Add a bit extra margin to the left
" set foldcolumn=1

" Show line numbers
map <silent> <leader>z :set nu!<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Toggle Highlight selected line
map <silent> <leader>q :set cursorline!<cr>

" Toggle Relative line numbers
map <silent> <leader>a :set number relativenumber!<cr>

" =====================
" => COLORS AND FONTS
" =====================

" Enable syntax highlighting
syntax enable 

" Background color
set background=dark

" Color scheme
try
	colorscheme gruvbox
catch
endtry

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" =====================
" => BACKUPS 
" =====================

" Turn backup off
set nobackup
set nowb
set noswapfile

try
  set undodir=$HOME/.config/nvim/undodir 
  set undofile
catch
	silent !mkdir -p $HOME/.config/nvim/undodir 
  set undodir=$HOME/.config/nvim/undodir 
  set undofile
endtry
" ========================
" => TABS AND INDENTATION 
" ========================

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 512 characters
set lbr
set tw=512

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" ========================================
" => MOVING AROUND TABS, WINDOWS, BUFFERS 
" ========================================

" Smart way to move between windows
nnoremap <silent> <c-k> <c-w>k<CR>
nnoremap <silent> <c-j> <c-w>j<CR>
nnoremap <silent> <c-h> <c-w>h<CR>
nnoremap <silent> <c-l> <c-w>l<CR>

" Move the splits around
nnoremap <silent> <c-s-k> <C-W>k
nnoremap <silent> <c-s-j> <C-W>j
nnoremap <silent> <c-s-h> <C-W>h
nnoremap <silent> <c-s-l> <C-W>l

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr() 


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"
"

" ===============
" => STATUS LINE 
" ===============

" Always show the status line
set laststatus=2

" ====================
" => Editing Mappings 
" ====================

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z

" Above mappings for macOS 
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" ===================
" => SPELL CHECKING 
" ===================

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" ===================
" => SPELL CHECKING 
" ===================

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" ==========
" => MACROS
" ==========

let @c = "I# \<Esc>A #\<Esc>yyPVr-r#$r#yyjp"

" ===================
" => HELPER FUNCTIONS 
" ===================

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" ===========
" => CTRL-P
" ===========

let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>

" Quickly find and open a recently opened file
map <leader>f :CtrlPMRU<CR>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" =============
" => Nerd Tree
" =============

" Position of the tree
let g:NERDTreeWinPos = "left"

" Show hidden files
let NERDTreeShowHidden = 0

" NERDTree width
let g:NERDTreeWinSize = 30

" Ignore these files and directories
let g:NERDTreeIgnore = ['^node_modules$', '^.git$', "^package-lock.json"]

" Case insensitive sort
let g:NERDTreeCaseSensitiveSort = 0

" Disable lines in the tree
let g:NERDTreeShowLineNumbers = 0

" Disbable bookmarks and help text
let g:NERDTreeMinimalUI = 1 

" Toggle NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" Find files in the NERDTree
map <leader>nf :NERDTreeFind<cr>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ================
" => Vim Markdown 
" ================

" Disable Vim Markdown folding
let g:vim_markdown_folding_disabled=1

" ====================
" => Vim Markdown TOC 
" ====================

" Auto-update TOC on save
let g:vmt_auto_update_on_save = 1

" Disable comments for TOC 
let g:vmt_dont_insert_fence = 1

" ====================
" => Vim Markdown TOC 
" ====================

" Open MD preview after opening .md files
let g:mkdp_auto_start = 0

" Refresh preview on leaving insert mode
let g:mkdp_refresh_slow = 1

" ===================
" => Airline Themes 
" ====================

let g:airline_theme='gruvbox'

" =========================
" => Conquer of Completion
" =========================

let g:go_def_mapping_enabled = 0
" Add automatic installation of coc-json coc-html coc-sh, coc-css, graphql, coc-tsserver and coc-go if not available

" ==========
" => Barbar
" ==========

" Move to previous/next
nnoremap <silent> <tab> :BufferNext<CR>
nnoremap <silent> <s-tab> :BufferPrevious<CR>
" Re-order to previous/next
nnoremap <silent> <a-s-<> :BufferMovePrevious<CR>
nnoremap <silent> <a-s->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent> <A-1> :BufferGoto 1<CR>
nnoremap <silent> <A-2> :BufferGoto 2<CR>
nnoremap <silent> <A-3> :BufferGoto 3<CR>
nnoremap <silent> <A-4> :BufferGoto 4<CR>
nnoremap <silent> <A-5> :BufferGoto 5<CR>
" Useful mappings for managing tabs
nnoremap <silent> <c-t> :tabnew<cr>
" nnoremap <leader>to :tabonly<cr>
" nnoremap <leader>tc :tabclose<cr>
" nnoremap <leader>tm :tabmove 
" nnoremap <leader>t<leader> :tabnext 
" Pin/unpin buffer
nnoremap <silent> <a-s-p> :BufferPin<CR>
" Close buffer
nnoremap <silent> <a-w> :BufferClose<CR>
nnoremap <leader>s :BufferClose<CR>
" Wipeout buffer:
" :BufferWipeout<CR>
" Close commands
nnoremap <silent> <a-s-w> :wqa<CR>
nnoremap <silent> <a-s-c> :BufferCloseAllButCurrent<CR>
nnoremap <silent> <a-s-x> :BufferCloseAllButPinned<CR>
nnoremap <silent> <a-s-h> :BufferCloseBuffersLeft<CR>
nnoremap <silent> <a-s-l> :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
" nnoremap <silent> <c-S> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <leader>bl :BufferOrderByLanguage<CR>

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
let bufferline.add_in_buffer_number_order = v:false

" Enable/disable animations
let bufferline.animation = v:false

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:true

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

