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

nnoremap ÇÇ :execute 'vim "' . expand('<cword>') . '"' . " ##"<CR>:copen<CR>

"function! RunShellCommand(...)
"    let cmd = join(a:000, ' ')
"    let cmd = 'sh -c "' . cmd . '"'
"    " Execute the command and capture the output
"    let output = system(cmd)
"    " Check for errors
"    if v:shell_error
"        " If there was an error, show it in the quickfix list
"        call setqflist([], 'r', {'title': 'Shell Command Error', 'items': [{'text': output}]})
"    else
"        " If successful, split the output into lines and create items for the quickfix list
"        let lines = split(output, '\n')
"        let items = map(lines, {_, line -> {'text': line}})
"        " Populate the quickfix list with the output lines
"        call setqflist([], 'r', {'title': 'Shell Command Output', 'items': items})
"    endif
"    " Open the quickfix window
"    copen
"endfunction
"command! -nargs=* -complete=file Compiler call RunShellCommand(<q-args>)

"function! RunShellCommand(...)
"    let cmd = join(a:000, ' ')
"    " Use :term to run the command in a terminal window
"    let term_cmd = 'term sh -c "' . cmd . '"'
"    " Open a new terminal buffer
"    execute term_cmd
"endfunction
"command! -nargs=* -complete=file Compiler call RunShellCommand(<q-args>)

function! GrepCWord()
    let l:word = expand('<cword>')
    silent! execute 'grep! -rn ' . l:word . ' **/*'
    redraw!
    copen
endfunction
nnoremap çç :call GrepCWord()<CR>

function! GrepCWordD()
    let l:word = expand('<cword>')
    silent! execute 'grep! -rn ' . l:word . ' **/*'
    let l:quickfix_list = getqflist()
    call sort(l:quickfix_list, {a,b -> (b.text =~ l:word . '(') ? 1 : 0})
    call setqflist(map(l:quickfix_list, 'v:val'), 'r')
    redraw!
    copen
endfunction
nnoremap çl :call GrepCWordD()<CR>

function! RunShellCommand(...)
    " Close all existing terminal buffers
    let term_buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&buftype") == "terminal"')
    for buf in term_buffers
        exec 'bdelete ' . buf
    endfor
    " Join the command arguments into a single string
    let cmd = join(a:000, ' ')
    " Create the terminal command
    let term_cmd = 'term sh -c "' . cmd . '"'
    " Open a new terminal buffer
    execute term_cmd
endfunction
command! -nargs=* -complete=file Compiler call RunShellCommand(<q-args>)
