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
elseif has_key(environ(), 'WT_SESSION')
    set ttymouse=sgr
endif

command! Ctags silent! execute '!rm -f tags; ctags -a -R ' .
  \ '--exclude=.git ' .
  \ '--exclude="*env/*" ' .
  \ '--exclude="*.js" ' .
  \ '--exclude="*.svg" ' .
  \ '--exclude="*.css" ' .
  \ '--exclude="*.json" ' .
  \ '--exclude="*.md" ' .
  \ '--exclude="*.properties" ' .
  \ '--exclude="*.xml" ' .
  \ '--exclude="*.1" ' .
  \ '--exclude="*.patch" ' .
  \ '--exclude="*Makefile" ' .
  \ '--exclude="*.rc" ' .
  \ '--exclude="*.txt" ' .
  \ '--exclude="*.bat" ' .
  \ '--exclude="*.sh" ' .
  \ '--exclude="*.in" ' .
  \ '--exclude="*.cmake" ' .
  \ '--exclude="*.mak" ' .
  \ '--exclude="*.vim" ' .
  \ '--exclude="*.ksh" ' .
  \ '--exclude="*.diff" ' .
  \ '--exclude="*.nsi" ' .
  \ '--exclude="*.cc" ' .
  \ '--exclude="*.ac" ' .
  \ '--exclude="*configure" ' .
  \ '--exclude="*.mk" ' .
  \ '--exclude="*.s" ' .
  \ '--exclude="*.ld" ' .
  \ '--exclude="*.inc" ' .
  \ '--exclude="*.html" .'
  \ | redraw!
  \ | source $MYVIMRC
  \ | silent! call HighlightCtags()
  \ | silent! call HighlightRegex()

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
function! g:HighlightCtags()
    if !exists('g:highlighted_identifiers')
        let g:highlighted_identifiers = []
    endif
    if empty(g:highlighted_identifiers)
        let list = taglist('.*')
        for item in list
            try
                let kind = item.kind
                if kind == 's' || kind == 'v' || kind == 'm' "kind == 'f' || kind == 'c' || kind == 's'
                    let name = item.name
                    call add(g:highlighted_identifiers, name)
                    exec 'syntax keyword Identifier ' . name
                endif
            catch
                echo "Error occurred while processing tag " . item.name . ' ' . item.kind
            endtry
        endfor
    else
        for name in g:highlighted_identifiers
            exec 'syntax keyword Identifier ' . name
        endfor
    endif
    " TODO 202602011246 use a different color and identifier to prevent
    " my text editor from turning completely yellow
    "exec 'highlight Identifier gui=bold guifg=yellowgreen'
endfunction
function! g:HighlightCtags()
    if !exists('g:highlighted_identifiers')
        let g:highlighted_identifiers = {}
    endif

    if empty(g:highlighted_identifiers)
        let list = taglist('.*')
        for item in list
            try
                let kind = item.kind
                let name = item.name
                if kind == 'f' || kind == 'c' || kind == 's' || kind == 'v' || kind == 'm' || kind == 'd' || kind == 't' || kind == 'e'
                    if !has_key(g:highlighted_identifiers, kind)
                        let g:highlighted_identifiers[kind] = []
                    endif
                    call add(g:highlighted_identifiers[kind], name)
                endif
            catch
                echo "Error occurred while processing tag " . item.name . ' ' . item.kind
            endtry
        endfor
    else
        for kind in keys(g:highlighted_identifiers)
            for name in g:highlighted_identifiers[kind]
                exec 'syntax keyword ' . kind . 'Identifier ' . name
            endfor
        endfor
    endif

    exec 'highlight FunctionIdentifier gui=italic guifg=#9ACD32'
    exec 'highlight ClassIdentifier gui=bold guifg=#ffaf5f'
    exec 'highlight StructureIdentifier gui=underline guifg=#d75f87'
    exec 'highlight TypedefIdentifier gui=underline guifg=#d75f87'
    exec 'highlight VariableIdentifier gui=bold guifg=#87d787'
    exec 'highlight EnumIdentifier gui=bold guifg=#87d787'
    "exec 'highlight MacroIdentifier gui=italic guifg=#268BD2'
    exec 'highlight MacroIdentifier gui=bold guifg=#87afaf'
    exec 'highlight DefinitionIdentifier gui=bold guifg=#d75f5f'

    exec 'syntax keyword FunctionIdentifier ' . join(g:highlighted_identifiers['f'], ' ')
    exec 'syntax keyword ClassIdentifier ' . join(g:highlighted_identifiers['c'], ' ')
    exec 'syntax keyword StructureIdentifier ' . join(g:highlighted_identifiers['s'], ' ')
    exec 'syntax keyword TypedefIdentifier ' . join(g:highlighted_identifiers['t'], ' ')
    exec 'syntax keyword VariableIdentifier ' . join(g:highlighted_identifiers['v'], ' ')
    exec 'syntax keyword EnumIdentifier ' . join(g:highlighted_identifiers['e'], ' ')
    exec 'syntax keyword MacroIdentifier ' . join(g:highlighted_identifiers['m'], ' ')
    exec 'syntax keyword DefinitionIdentifier ' . join(g:highlighted_identifiers['d'], ' ')
endfunction
function! g:HighlightRegex()
    exec 'syn match    cCustomParen    "?=(" contains=cParen,cCppParen'
    exec 'syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen'
    exec 'syn match    cCustomScope    "::"'
    exec 'syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope'
    exec 'hi def cCustomFunc  gui=bold guifg=yellowgreen'
    exec 'hi def link cCustomClass Function'
endfunction
autocmd BufReadPost * silent! call g:HighlightCtags()
autocmd BufReadPost * call timer_start(0, {-> g:HighlightRegex()})
