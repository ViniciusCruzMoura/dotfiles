syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set guioptions-=m
set guioptions-=T
set noesckeys
set ignorecase
set smartcase
set incsearch
set cinoptions=l1
set modeline
set background=dark
set termguicolors
try
  "colorscheme base16-gruvbox-dark-hard
  colorscheme base16-darktooth
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme slate
endtry

set nocompatible
set nowrap
set showcmd
set showmode
set showmatch
set hlsearch
set wildmenu
set wildmode=list,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set path+=**
set scrolloff=1000

set visualbell

"set noswapfile
"set nobackup
"set nowb

let g:netrw_banner=0
let g:netrw_liststyle=3
