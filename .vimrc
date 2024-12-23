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

" Quick Format
nnoremap f' :silent! normal "zyiw<Esc>:let @z="'".@z."'"<CR>cw<c-r>z<Esc>b
nnoremap f" :silent! normal "zyiw<Esc>:let @z="\"".@z."\""<CR>cw<c-r>z<Esc>b
nnoremap f( :silent! normal "zyiw<Esc>:let @z="(".@z.")"<CR>cw<c-r>z<Esc>b
nnoremap f[ :silent! normal "zyiw<Esc>:let @z="[".@z."]"<CR>cw<c-r>z<Esc>b
nnoremap fd :silent! normal mpeld bhd `ph<CR>

" Quick Select
nnoremap vw viw
nnoremap v( vi(
nnoremap v" vi"
nnoremap v' vi'
nnoremap v{ vi{
nnoremap v[ vi[

" Automatically add closing ( { [ ' " `
 inoremap { {}<ESC>i
" inoremap ( ()<ESC>i
 inoremap [ []<ESC>i
" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i
" inoremap ` ``<ESC>i

" Quick Key Mapping
nnoremap ;0 :nnoremap ; :C make <Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Quick Buffer Navigation
nnoremap <C-k> :bnext<cr>
nnoremap <C-j> :bprev<cr>

" Quick Save and Quit
nnoremap ;w :w<CR>
nnoremap ;q :q<CR>

" Paste yanked word
noremap 0p "0p
noremap 0P "0P
noremap "p ""p

" Resize the windows
nnoremap + :res +5<CR>
nnoremap _ :res -5<CR>

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
"command -nargs=+ -complete=file Run :cexpr system('<args>') | copen
nnoremap ;g :cexpr system("grep -rn '' ") \| copen <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Quick Replace
nnoremap ;r :%s/<C-r>=expand("<cword>")<CR>//gc <Left><Left><Left><Left>
"command! Replace exec '%s/' . expand("<cword>") . '/' . input('replace with: ') . '/gc'

" Quick Search on the internet
command! Search silent! exec '!firefox -private-window "https://duckduckgo.com/?q=' . input('search: ') . '" ' | redraw!

" TO SEARCH A DEFINITION
function! GrepCWordD()
    let l:word = expand('<cword>')
    silent! execute 'grep! -rn ' . l:word . ' **/* *'
    let l:quickfix_list = getqflist()
    "call sort(l:quickfix_list, {a,b -> (b.text =~ l:word . '(') ? 1 : 0})
    call sort(l:quickfix_list, {a, b -> (match(a.text, '\v(\w+)\s+' . l:word) >= 0 && match(b.text, '\v(\w+)\s+' . l:word) < 0) ? -1 : (match(b.text, '\v(\w+)\s+' . l:word) >= 0 && match(a.text, '\v(\w+)\s+' . l:word) < 0) ? 1 : (match(a.text, l:word . '(') >= 0 && match(b.text, l:word . '(') < 0) ? -1 : (match(b.text, l:word . '(') >= 0 && match(a.text, l:word . '(') < 0) ? 1 : 0})
    call setqflist(map(l:quickfix_list, 'v:val'), 'r')
    redraw!
    copen
endfunction
nnoremap ff :call GrepCWordD()<CR>

" TO SEARCH A WORD
command! -nargs=1 Grep call s:grep_pattern(<f-args>)
function! s:grep_pattern(pattern)
    silent! execute 'grep! -nr "' . a:pattern . '" **/* *'
    "silent! execute 'grep! -nr "\b[A-Za-z_][A-Za-z0-9_]* ' . a:pattern . '" **/*'
    let l:quickfix_list = getqflist()
    "call sort(l:quickfix_list, {a,b -> (b.text =~ a:pattern . '(') ? 1 : 0})
    "call sort(l:quickfix_list, {a,b -> (b.text =~ '\v(\w+)\s+' . a:pattern) ? 1 : 0})
    call sort(l:quickfix_list, {a, b -> (match(a.text, '\v(\w+)\s+' . a:pattern) >= 0 && match(b.text, '\v(\w+)\s+' . a:pattern) < 0) ? -1 : (match(b.text, '\v(\w+)\s+' . a:pattern) >= 0 && match(a.text, '\v(\w+)\s+' . a:pattern) < 0) ? 1 : (match(a.text, a:pattern . '(') >= 0 && match(b.text, a:pattern . '(') < 0) ? -1 : (match(b.text, a:pattern . '(') >= 0 && match(a.text, a:pattern . '(') < 0) ? 1 : 0})
    call setqflist(map(l:quickfix_list, 'v:val'), 'r')
    redraw!
    copen
endfunction

" TO EXECUTE BASH COMMANDS
function! RunShellCommand(...)
    let term_buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&buftype") == "terminal"')
    for buf in term_buffers
        exec 'bdelete ' . buf
    endfor
    let cmd = join(a:000, ' ')
    let term_cmd = 'term sh -c "' . cmd . '"'
    execute term_cmd
endfunction
command! -nargs=* -complete=file Compiler call RunShellCommand(<q-args>)

command! -nargs=* Replace call s:quick_replace_word(<f-args>)
function! s:quick_replace_word(...)
    let l:args = a:000
    if len(l:args) == 1
        let l:word = expand('<cword>')
        let l:new = l:args[0]
        execute '%s/' . l:word . '/' . l:new . '/gc'
        return
    endif
    if len(l:args) == 2
        let l:current = l:args[0]
        let l:new = l:args[1]
        execute '%s/' . l:current . '/' . l:new . '/gc'
        return
    endif
endfunction
