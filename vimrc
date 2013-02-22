"Inspirado en 
"https://raw.github.com/nvie/vimrc/master/vimrc 
"https://github.com/derekwyatt/vim-config/blob/master/vimrc
"http://nvie.com/posts/how-i-boosted-my-vim/
"https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"
" Atajos de teclado:
" ,s guardado	,ev	Editar vimrc	,sv Recargar vimrc	,l Show Tabs & Intros
" ,tl muestra/oculta las líneas de código para copiar texto.
" <F2> Activa pegado (Para que no indente y no comente etc"
" Ctrl-h/j/k/l Mueve por ventanas para no tener que pulsar control+w
",em edita menu de openbox ,er edita rc de openbox

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

"MAPEO DE LA TECLA LIDER
"Modificamos la tecla líder por defecto \ a la coma ,
let mapleader=","
noremap <leader>,nt :NERDTree<cr>
"creamos el acceso directo a editar .vimrc con ,ev<cr> y ,sv<cr> para cargarlo de nuevo
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>
nmap <silent> <leader>em :e ~/.config/openbox/menu.xml
nmap <silent> <leader>er :e ~/.config/openbox/rc.xml
nmap <silent> <leader>tl :set invnumber<cr>
"Mapeamos ,s para salvado rápido
noremap <leader>s :update<CR>

"Mapeo de la tecla escape:
inoremap jk <Esc>
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
nmap <TAB> <C-w>
nmap <TAB><TAB> <C-w><C-w>
set hid
set autoread
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
set foldcolumn=1
set backspace=start,indent,eol
set t_Co=256
colorscheme wombat256mod
syntax on
if has ( "colorcolumn" )
		set colorcolumn=80
endif
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
