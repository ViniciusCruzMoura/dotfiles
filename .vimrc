syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set guioptions-=m
set guioptions-=T
set noesckeys
set relativenumber
set number
set ignorecase
set smartcase
set incsearch
set cinoptions=l1
set modeline
set background=dark
set termguicolors
"https://github.com/rafi/awesome-vim-colorschemes
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme slate
endtry

autocmd BufEnter * if &filetype == "go" | setlocal noexpandtab

set nocompatible
"set cursorline
set nowrap
set showcmd
set showmode
set showmatch
set hlsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set path+=**

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

set visualbell

noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

"set noswapfile
"set nobackup
"set nowb
