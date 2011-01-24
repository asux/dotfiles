source ~asux/.vim/vimrc
set term=xterm-color

if has('gui_running')
  colorscheme railscasts
else  
  colorscheme vibrantink
endif

set guifont=Monaco

nmap <F5> :Rserver<CR>
nmap <F6> :Rake spec<CR>
nmap <F7> :!cap deploy<CR>

nmap <F9> :GitStatus<CR>
nmap <F10> :GitAdd .<CR>
nmap <F11> :GitCommit -a<CR>

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest "

" Edit routes
command! Eroutes :e config/routes.rb
command! Eschema :e db/schema.rb
command! EG :e Gemfile

map <C-n> :tabnew<CR>
map <C-t> :CommandT<CR>
