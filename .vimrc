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
  colorscheme habamax
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
set path=$PWD/**
" set scrolloff=1000
set visualbell
set mouse=inv
set splitright
set splitbelow
set belloff=all
"set noswapfile
"set nobackup
"set nowb
let g:netrw_banner=0
" let g:netrw_winsize = 25
let g:netrw_liststyle=1
let g:netrw_sort_by='exten'
let g:netrw_sizestyle= "h"
set omnifunc=syntaxcomplete#Complete

if $TERM =~ 'tmux'
    set ttymouse=xterm2
endif

command! Ctags silent! execute '!ctags -a -R --exclude=.git .' | redraw!

command! GitBlame execute '!git blame --date short --color-by-age -L' .(line('.')-0). ',' .(line('.')+10). ' %'
" :execute '!git blame --date short --color-by-age -L' .(line('.')-5). ',' .(line('.')+5). ' %'
" !git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10

" https://vim.fandom.com/wiki/Copy_and_paste_between_sessions_using_a_temporary_file
" https://vim.fandom.com/wiki/Copy_and_paste_between_Vim_instances
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! /tmp/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! /tmp/reg.txt<CR>
map <silent> ,p :sview /tmp/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview /tmp/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" Quick Format
vnoremap ' c'<C-r>"'<Esc>
vnoremap " c"<C-r>""<Esc>
vnoremap ( c(<C-r>")<Esc>
vnoremap [ c[<C-r>"]<Esc>

" Quick Select
nnoremap ve viw
nnoremap vw viw
nnoremap v( vi(
nnoremap v" vi"
nnoremap v' vi'
nnoremap v{ vi{
nnoremap v[ vi[

" Automatically add closing ( { [
function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')

" Quick Key Mapping
nnoremap ;0 :nnoremap ; :term make <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Paste yanked word
noremap 0p "0p
noremap 0P "0P
noremap "p ""p

" Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ;c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ;u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Grep and Quickfix
" command -nargs=+ -complete=file Run :cexpr system('<args>') | copen
nnoremap ;g :cgetexpr system("grep -rn --include=*.{c,h,cpp,py,java,js} -s -e '<C-r>=expand("<cword>")<CR>' ") \
            \| copen <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen

" Quick Replace
nnoremap ;r :%s/<C-r>=expand("<cword>")<CR>//gc <Left><Left><Left><Left>
nnoremap ;R :s/<C-r>=expand("<cword>")<CR>//gc <Left><Left><Left><Left>
" command! Replace exec '%s/' . expand("<cword>") . '/' . input('replace with: ') . '/gc'

" Quick Search on the internet
command! Search silent! exec '!firefox -private-window "https://duckduckgo.com/?q=' . input('search: ') . '" ' | redraw!

" Json Formater with Python Script
command! Jsonf :execute '%!python -c "import json,sys,collections,re; sys.stdout.write(re.sub(r\"\\\u[0-9a-f]{4}\", lambda m:m.group().decode(\"unicode_escape\").encode(\"utf-8\"),json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=2)))"'

" Activate the Mouse Support for NetRW
au FileType netrw :set mouse=n
au FileType netrw au BufEnter <buffer> :set mouse=n
au FileType netrw au BufLeave <buffer> :set mouse=inv
" au FileType netrw nmap <buffer> <LeftMouse> <LeftMouse> <CR>

" https://stackoverflow.com/questions/736701/class-function-names-highlighting-in-vim
function! g:Highlight()
    let list = taglist('.*')
    for item in list
        "echo item.name item.kind
        let kind = item.kind
        "if kind == 'f' || kind == 'c' || kind == 'm'
            let name = item.name
            exec 'syntax keyword Identifier '.name
        "endif
        exec 'highlight Identifier gui=bold guifg=yellowgreen'
    endfor
endfunction
function! g:HighlightRegex()
    exec 'syn match    cCustomParen    "?=(" contains=cParen,cCppParen'
    exec 'syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen'
    exec 'syn match    cCustomScope    "::"'
    exec 'syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope'
    exec 'hi def cCustomFunc  gui=bold guifg=yellowgreen'
    exec 'hi def link cCustomClass Function'
endfunction
"autocmd BufReadPost * call Highlight()
autocmd BufReadPost * call timer_start(0, {-> g:HighlightRegex()})
