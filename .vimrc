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
set mouse=i
set splitright
set splitbelow
"set noswapfile
"set nobackup
"set nowb
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize = 25

" :execute '!git blame --date short --color-by-age -L' .(line('.')-5). ',' .(line('.')+5). ' %'
" !git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10
" https://vim.fandom.com/wiki/Copy_and_paste_between_sessions_using_a_temporary_file
" https://vim.fandom.com/wiki/Copy_and_paste_between_Vim_instances

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

" Quick Buffer Navigation
nnoremap <C-k> :bnext<cr>
nnoremap <C-j> :bprev<cr>

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
nnoremap ;g :cgetexpr system("grep -rn --include=*.{c,h,py,java,js} -s -e '<C-r>=expand("<cword>")<CR>' ") \
            \| copen <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Quick Replace
nnoremap ;r :%s/<C-r>=expand("<cword>")<CR>//gc <Left><Left><Left><Left>
"command! Replace exec '%s/' . expand("<cword>") . '/' . input('replace with: ') . '/gc'

" Quick Search on the internet
command! Search silent! exec '!firefox -private-window "https://duckduckgo.com/?q=' . input('search: ') . '" ' | redraw!

" TO SEARCH A WORD
command! -nargs=1 Grep call s:grep_pattern(<f-args>)
function! s:grep_pattern(pattern)
    silent! execute 'grep! -nr "' . a:pattern . '" **/*'
    let l:quickfix_list = getqflist()
    call sort(l:quickfix_list, {a, b -> (match(a.text, '\v(\w+)\s+' . a:pattern) >= 0 && match(b.text, '\v(\w+)\s+' . a:pattern) < 0) ? -1 : (match(b.text, '\v(\w+)\s+' . a:pattern) >= 0 && match(a.text, '\v(\w+)\s+' . a:pattern) < 0) ? 1 : (match(a.text, a:pattern . '(') >= 0 && match(b.text, a:pattern . '(') < 0) ? -1 : (match(b.text, a:pattern . '(') >= 0 && match(a.text, a:pattern . '(') < 0) ? 1 : 0})
    call setqflist(map(l:quickfix_list, 'v:val'), 'r')
    redraw!
    copen
endfunction

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
