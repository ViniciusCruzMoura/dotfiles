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
"https://github.com/rafi/awesome-vim-colorschemes https://github.com/mcchrish/vim-no-color-collections
try
  colorscheme base16-gruvbox-dark-hard "base16-grayscale-dark
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
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set path+=**

"set statusline=
"set statusline+=\ %n\                                 " Buffer number
"set statusline+=\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
"set statusline+=│                                     " Separator
"set statusline+=\ %Y\                                 " FileType
"set statusline+=│                                     " Separator
"set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
"set statusline+=\ (%{&ff})                            " FileFormat (dos/unix..)
"set statusline+=%=                                    " Right Side
"set statusline+=\ col:\ %02v\                         " Colomn number
"set statusline+=│                                     " Separator
"set statusline+=\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
"set laststatus=2
set visualbell

noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

"set noswapfile
"set nobackup
"set nowb

let g:netrw_banner=0
let g:netrw_liststyle=3
