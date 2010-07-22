set nocompatible
syntax on
filetype on
set ignorecase
set autoindent
set background=dark
set incsearch
set nohlsearch
set mouse=a
highlight Comment ctermfg=darkgrey
nmap <F2> :w!<CR>
nmap <F10> :q<CR>
nmap <F11> :q!<CR>
nmap <C-s> :w!<CR>
"set backup
"set backupdir=~/.vimbk
set ts=4
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r
set number
"set foldmethod=indent
"set foldcolumn=2
"set foldopen=all
if has("autocmd")
	autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP
	autocmd FileType c set omnifunc=ccomplete#Complete
endif " has("autocmd") 
set smartindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab 
set smartcase
" AutoCloseOn
imap <C-F> <C-X><C-O>
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2

