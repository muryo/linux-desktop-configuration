""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General  for my own habit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sets how many lines of history VIM has to remember
set history=300

if has("syntax")
	syntax on
endif

let asmsyntax="nasm"  

"set fileencoding=ucs-bom,utf-8

set background=dark

set showmatch
set smartcase

set mouse=a  " Enable mouse usage(all modes)

set cindent shiftwidth=8

set nobackup " no backup
set noswapfile

"set paste
set nocp "not compatible with vi for advanced 

set hls  "highlight what you are searching

set is  "begin searching before  input fully

set nu

"set tags=~/.vim/tags/stltags
set tags=tags;
"set autochdir

set cscopequickfix=s-,c-,d-,i-,t-,e-

filetype plugin indent on
set completeopt=longest,menu

set cmdheight=2 "The commandbar height

"my statusline setting
set statusline=%F%m\[ASCII=\%02.2B]\[POS=%04l,%04v][%p%%]\[LEN=%L]
set laststatus=2


colorscheme desert

autocmd BufNewFile *.cpp,*.c,*.h exec ":call SetMyTitle()"
autocmd BufNewFile *.h exec ":call SetMyGuard()"

"when vimrc is edited, reload it
autocmd! bufwritepost .vimrc sourc ~/.vimrc
"function
func! SetMyTitle()
    call	setline(1,"/*****************************************************")
    call	append(line(".")," *@File:\t".expand("%"))
    call	append(line(".")+1," *@Created:\t".strftime("%c"))
    call	append(line(".")+2," *@Author:\tmuryo")
    call	append(line(".")+3," *@Description:")
    call	append(line(".")+4," *@")
    call        append(line(".")+5,"*******************************************************/")
    exec "normal! G1o"
endfunc

func! SetMyGuard()
    let gatename=substitute(toupper(expand("%:t")),"\\.","_","g")
    exec "normal! Gi#ifndef __".gatename."__"
    exec "normal! o#define __".gatename."__\n\n"
    exec "normal! o#endif /*__".gatename."__*/"
endfunc

func! SFT(str)
    call	    setline(line("."),"/*******************************************")
    call	append(line(".")," *@Function:\t\t".a:str)
    call	append(line(".")+1," *@Arguments:")
    call	append(line(".")+2," *@Description:")
    call	append(line(".")+3," *@")
    call        append(line(".")+4,"*********************************************/")
"    exec	"normal! G1oi"
endfunc



" Enable filetype plugin ??????????????????
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

"map leader ??????????????????????????????????
let mapleader=";"
nmap <space> :

map <silent><leader>ee : vnew  $HOME/.vimrc<cr>
"快速进入shell
nmap <C-X> :shell<cr>
nmap <leader>ww :w!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
"set so=7

set ruler "Always show current position

" cscope 绑定
if has("cscope")
    set csto=1
    set cst
    set nocsverb
" already done in cscope_maps.vim 
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    " s: C语言符号  g: 定义     d: 这个函数调用的函数 c: 调用这个函数的函数
    " t: 文本       e: egrep模式    f: 文件     i: include本文件的文件
    nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


" Taglist 设置
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
nmap <silent> <leader>tl :TlistToggle<cr>

" winManager 设置
let g:winManagerWindowLayout='FileExplorer|Tlist'
nmap wm :WMToggle<cr>

" for git
autocmd Filetype gitcommit setlocal spell textwidth=72
set cursorline
set colorcolumn=100
set splitright
"set splitbelow

set paste

" for mutt
" autocmd BufRead,BufNewFile /tmp/mutt-* source $HOME/.vimrc-mutt
