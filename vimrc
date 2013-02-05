"Inspirado en 
"https://raw.github.com/nvie/vimrc/master/vimrc 
"https://github.com/derekwyatt/vim-config/blob/master/vimrc
"http://nvie.com/posts/how-i-boosted-my-vim/
" Atajos de teclado:
" ,s guardado	,ev	Editar vimrc	,sv Recargar vimrc	,l Show Tabs & Intros
" <F2> Activa pegado (Para que no indente y no comente etc"
" Ctrl-h/j/k/l Mueve por ventanas para no tener que pulsar control+w
",em edita menu de openbox ,er edita rc de openbox
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
"Modificamos la tecla líder por defecto \ a la coma ,
let mapleader=","
"creamos el acceso directo a editar .vimrc con ,ev<cr> y ,sv<cr> para cargarlo de nuevo
nmap <silent> <leader>ev :e $MYVIMRC
nmap <silent> <leader>sv :so $MYVIMRC
nmap <silent> <leader>em :e ~/.config/openbox/menu.xml
nmap <silent> <leader>er :e ~/.config/openbox/rc.xml

"Mapeamos ,s para salvado rápido
noremap <leader>s :update<CR>
"Desmapeo las teclas de dirección para acostumbrarme a hjkl
noremap <Up> ""
noremap! <Up> <Esc>
noremap <Down> ""
noremap! <Down> <Esc>
noremap <Left> ""
noremap! <Left> <Esc>
noremap <Right> ""
noremap! <Right> <Esc>
set pastetoggle=<F2>
"Muestra tabs y eol al pulsar la tecla líder seguida de l
:set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"Mapeo teclas para insertar/borrar líneas en blanco NO FUNCIONA.
"nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
"Tamaño de tabulador:
set tabstop=4
"Cambiamos el aspecto
set laststatus=2 "Muestra la barra de estado siempre
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set ruler "Muestra línea y columna 
set wrapscan
set number
set title
set backspace=start,indent,eol
set t_Co=256
colorscheme wombat256mod
syntax on
<<<<<<< HEAD
=======
if has ( "colorcolumn" )
		set colorcolumn=80
endif
>>>>>>> 04669dcc1ec150801fbf69401b2ef9d3e8fcd3ea
set showmode
"Deshabilitamos los archivos de copia de seguridad
set nobackup
set noswapfile
"Configuraciones sobre busquedas.
set ignorecase "Ignora mayúsculas cuando busca
set smartcase "Ignora may si el término de busq es minúscula si tiene may no.
set incsearch "Muestra la primera coincidencia al usar la busqueda.  set hlsearch " Resalta los térmnos de búsqueda.
"Ponemos opción hidden para que oculte los buffers
set hidden
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set tags=tags;~/.vim/tags/CodeIgniter
au Filetype html,xml,xsl source ~/.vim/bundle/closetag/plugin/closetag.vim
"exrc http://www.ilker.de/specific-vim-settings-per-project.html
set exrc "Respeta los archivos .exrc y .vimrc locales en carpetas
set secure "Hace exrc que sea seguro.
