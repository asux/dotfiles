source ~/.vim/vimrc

set guifont=Ubuntu\ Mono\ 12

if has('gui_running')
  colorscheme molokai
endif

nmap <F5> :Rserver<CR>
nmap <F6> :Rake spec<CR>
nmap <F7> :bundle exec rake vlad:deploy<CR>

nmap <F9> :GitStatus<CR>
nmap <F10> :GitAdd .<CR>
nmap <F11> :GitCommit -a<CR>

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel
map <Leader>co :Rcontroller
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
map <Leader>sf :RSfunctionaltest

" Edit routes
command! Eroutes :e config/routes.rb
command! Eschema :e db/schema.rb

map <C-t> :CommandT<CR>
map <S-t> :tabnew<CR>

map <C-h> :TlistToggle<cr>
