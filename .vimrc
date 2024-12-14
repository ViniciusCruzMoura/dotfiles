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

" TO SEARCH A DEFINITION
function! GrepCWord()
    let l:word = expand('<cword>')
    silent! execute 'grep! -rn ' . l:word . ' **/*'
    let l:quickfix_list = getqflist()
    "call sort(l:quickfix_list, {a,b -> (b.text =~ l:word . '(') ? 1 : 0})
    call sort(l:quickfix_list, {a, b -> (match(a.text, '\v(\w+)\s+' . l:word) >= 0 && match(b.text, '\v(\w+)\s+' . l:word) < 0) ? -1 : (match(b.text, '\v(\w+)\s+' . l:word) >= 0 && match(a.text, '\v(\w+)\s+' . l:word) < 0) ? 1 : (match(a.text, l:word . '(') >= 0 && match(b.text, l:word . '(') < 0) ? -1 : (match(b.text, l:word . '(') >= 0 && match(a.text, l:word . '(') < 0) ? 1 : 0})
    call setqflist(map(l:quickfix_list, 'v:val'), 'r')
    redraw!
    copen
endfunction
nnoremap ff :call GrepCWord()<CR>

" TO SEARCH A WORD
command! -nargs=1 Grep call s:grep_pattern(<f-args>)
function! s:grep_pattern(pattern)
    silent! execute 'grep! -nr "' . a:pattern . '" **/*'
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

" TO REPLACE A WORD
command! -nargs=* Replace call ReplaceWord(<f-args>)
function! ReplaceWord(...)
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
    echo "Replace command requires exactly 1 arguments"
endfunction

" TO SEARCH FOR THINGS ON THE INTERNET
command! -nargs=1 DuckDuckGo call DuckDuckGoSearch(<f-args>)
function! DuckDuckGoSearch(word)
    silent! execute '!firefox -private-window "https://duckduckgo.com/?q=' . a:word . '" '
    redraw!
    return
endfunction
