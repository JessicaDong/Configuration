set nocompatible

call pathogen#infect()
filetype plugin on
filetype indent on
set nu

syntax enable
syntax on
set ruler
set incsearch
set hlsearch
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Allow cursor keys in insert mode
set esckeys
" Highlight current line
set cursorline
" Show the (partial) command as it~Rs being typed
set showcmd
"let g:solarized_termcolors=256
"colorscheme solarized

"set tabstop=4

"set shiftwidth=4

"set softtabstop=4

set smarttab
set autoindent
"set smartindent
"

"set foldmethod=indent
set foldmethod=marker
""""""""""""""""""""""""""""""
" airline setting
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_detect_whitespace          = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme                      = "bubblegum"

if has("autocmd")
        autocmd BufNewFile,BufRead *.c,*.cpp set tabstop=4 shiftwidth=4
endif


map <F5> :call Compile()<CR>
function! CompileGcc()
    exec "w"
    let compilecmd="!gcc -Wall -std=c99 "
    let compileflag="-o %<"
    exec compilecmd." % ".compileflag
endfunction

function! CompileCpp()
    exec "w"
    let compilecmd="!g++ -Wall "
    let compileflag="-o %<"
    exec compilecmd." % ".compileflag
endfunction

function! Compile()
        exec "w"
        if &filetype == "c"
            exec "call CompileGcc()"
        elseif &filetype == "cpp"
            exec "call CompileCpp()"
        endif
endfunction


map <F6> :call Run()<CR>
function! Run()
        exec "w"
        if &filetype == "c"
            exec "! ./%<"
        elseif &filetype == "cpp"
            exec "! ./%<"
        elseif &filetype == "ksh" || &filetype == "sh"
                exec "!sh %"
        endif
endfunction


map <F7> :call CompileRun()<CR>

function! CompileGccRun()
        exec "w"
        exec "!gcc -Wall % -o %<"
        exec "! ./%<"
endfunction

function! CompileCppRun()
        exec "w"
        exec "!g++ -Wall % -o %<"
        exec "! ./%<"
endfunction

function! CompileRun()
        exec "w"
        if &filetype == "c"
            exec "call CompileGccRun()"
        elseif &filetype == "cpp"
            exec "call CompileCppRun()"
        endif
endfunction


“set cinoptions=t0,(.5s,u0,:0,+.5s 
