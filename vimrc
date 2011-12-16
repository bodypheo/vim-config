"Inspirado en 
"https://raw.github.com/nvie/vimrc/master/vimrc 
"https://github.com/derekwyatt/vim-config/blob/master/vimrc
filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
filetype plugin indent on
"Modificamos la tecla líder por defecto \ a la coma ,
let mapleader=","
"Creamos el acceso directo a editar .vimrc con ,ev<CR> y ,sv<CR> para cargarlo de nuevo
nmap <silent> <leader>ev :e $MYVIMRC
nmap <silent> <leader>sv :so $MYVIMRC
"Cambiamos el aspecto
set ruler
set wrapscan
set number
set title
set backspace=start,indent,eol
set t_Co=256
colorscheme wombat256mod
set showmode
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set tags=tags;~/.vim/tags/CodeIgniter
syntax on
set exrc
