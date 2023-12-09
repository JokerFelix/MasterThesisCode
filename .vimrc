"Vim configuration file
" 2022-11-18


" To auto install these features, you could check if vundle is existing.
" If not, download all the required packages from github repo. 

" enables vim new feature's over vi
set nocompatible              " be iMproved, required
" will be reset after vundle plugin install, plugin based.
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Enable syntax highlighting
syntax on

" Enable more colors
set t_Co=256

" Background set to light
set background=light

" Set the preferred colorscheme
colorscheme shine

" Use the mouse, but will select now in vim visual instead of normally
set mouse=a

" Allow backspace to delete EOL, automatic indentation, etc
set backspace=2

"Print out the line numbers
set number

"Better completion of commands
set wildmenu

" adds sub and sub sub paths to the path
set path+=**

" always show the status bar
set laststatus=2


" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8


" Enable text folding on indent u can use za to fold
set foldmethod=manual

"Unfold by default
set foldlevel=99

"Keep indentation level for new line by default
set autoindent

"Smart indentation for better autoalignment
set smarttab

" PEP Style Guide (remember to use 2 lines of space between func etc.)
au Filetype python set
            \ textwidth=79
            \ tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ expandtab
	    \ fileformat=unix

" Tells linter to go with flake8 for python
let g:ale_linters = {'python': ['flake8']}
            
" Create the `tags` file by ":MakeTag" (may need to install ctags first)
command! MakeTags !/usr/local/Cellar/ctags/5.8_2/bin/ctags -R --fields=+l --python-kinds=-iv -f ./tags ./


" Tweaks for browsing file/folder tree, run with Explore, V/Sexplore
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


" Read an empty HTML template and move cursor to title
" nnoremap is keyremapping non self calling in normal mode
" ,html is what you need to insert the snippet
" :-1read will read from a file but insert it 1 line down
" $Home... is path to the snippet 
" <CR> is the enter keyword 
" 3jwf>a are normal commands to execute aswell
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a


" better yet to use make and get error tracking
" These will auto create map for filetype python to run files code in py3 by <F5> click
" map for running it in normal mode
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" imap for running in insert mode 
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" calling make to make single file projects
"autocmd FileType c nnoremap <silent> <f7> :w<CR>:make<CR>:copen<CR>
"autocmd FileType Java nnoremap <silent> <f7> :w<CR>:!javac ./%<.java<CR>
"autocmd FileType Python nnoremap <silent> <f7> :w<CR>:!python3 ./%<CR>:copen<CR>

" calling make and only running after sucess, changed from make %<
"autocmd FileType c nnoremap <silent> <f8> :w<CR>:make<CR>:!./%<<CR>
"autocmd FileType Java nnoremap <silent> <f8> :w<CR>:!javac ./%<.java<CR>:!java %<<CR>
"autocmd FileType Python nnoremap <silent> <f8> :w<CR>:!python3 ./%<CR>

" using :cN and :cn to navigate errors, makefile if neccessary for larger
nnoremap <silent> <f9> :cp<CR>
nnoremap <silent> <f10> :cn<CR>
