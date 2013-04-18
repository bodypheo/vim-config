" Atajos de teclado:
" ,s guardado	,ev	Editar vimrc	,sv Recargar vimrc	,i Show invisible
" chars
" ,tl muestra/oculta las líneas de código para copiar texto.
" ,e carg NerdTree
" <F2> Activa pegado (Para que no indente y no comente etc"
" Ctrl-h/j/k/l Mueve por ventanas para no tener que pulsar control+w
",em edita menu de openbox ,er edita rc de openbox

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
set nocompatible

"##############################################################
" Opciones básicas
"##############################################################
"Autoread funciona cuando se ejecuta algún comando en la shell. P.ej:
":checkdate o al guardar.También se puede poner un autocmd
set autoread
"Deshabilitamos los archivos de copia de seguridad
set nobackup
set noswapfile
"Configuraciones sobre busquedas.
set ignorecase "Ignora mayúsculas cuando busca
set smartcase "Ignora may si el término de busq es minúscula si tiene may no.
set incsearch "Muestra la primera coincidencia al usar la busqueda.  set hlsearch " Resalta los térmnos de búsqueda.
"Oculta los buffers en lugar de cerrarlos.
set hidden
"exrc http://www.ilker.de/specific-vim-settings-per-project.html
set exrc "Respeta los archivos .exrc y .vimrc locales en carpetas
set secure "Hace exrc que sea seguro.
set backspace=start,indent,eol
set mouse=a
set encoding=utf-8
"##############################################################
"Mapeo de teclas
"##############################################################
let mapleader=","
noremap <leader>nt :NERDTree<cr>
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>
nmap <silent> <leader>em :e ~/.config/openbox/menu.xml<cr>
nmap <silent> <leader>er :e ~/.config/openbox/rc.xml<cr>
nmap <silent> <leader>ea :e ~/.config/openbox/autostart<cr>
nmap <silent> <leader>et :e ~/.tmux.conf<cr>
nmap <silent> <leader>tl :set invnumber<cr>
"Mapeamos ,s para salvado rápido
noremap <leader>s :update<CR>

"Para avance de página con espacio
map <Space> <C-d>
"Mapeo de la tecla escape:
inoremap jk <Esc>
"Impedir que mueva el cursor cuando usemos J para unir líneas
nnoremap J mzJ'z
"Centrar la pantalla después de buscar o ir al siguiente párrafo
nnoremap n nzz
nnoremap } }zz

"Mapeo de gj y gh para que vaya línea a línea aunque no haya salto de línea
"(softwrap)
map j gj
map k gk
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
"Para no activar el mode EX
nnoremap Q <nop>
"Muestra tabs y eol al pulsar la tecla líder seguida de l
:set listchars=tab:▸\ ,eol:¬
nmap <leader>i :set list!<CR>
" Easy window navigation
nmap <TAB> <C-w>
nmap <TAB><TAB> <C-w><C-w>
nnoremap K :q<cr>

"##############################################################
" Opciones gráficas
"##############################################################
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
set t_Co=256
if has ('gui_running')
	set guioptions-=T " sin barra de herramientas.
	set guioptions-=m " sin menu
	set guioptions-=r " sin barra de scroll.
	colorscheme molokai
	set lines=50 columns=96 linespace=0
else
	colorscheme wombat256mod
endif
syntax on
if has ( "colorcolumn" )
		set colorcolumn=80
endif
set showmode
set splitbelow
set splitright
set completeopt=longest,menuone,preview
"##############################################################
" Misc
"##############################################################
au Filetype html,xml,xsl source ~/.vim/bundle/closetag/plugin/closetag.vim

"Va a la última posición donde se encontraba el archivo cuando se cerro.
"http://nixtricks.wordpress.com/2012/01/05/vim-automatically-jump-to-the-last-visited-line-when-a-file-is-reopened/
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif
au FocusLost * :silent! wall

"##############################################################
" Creditos 
"##############################################################
"Steve Losh: https://bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
"https://raw.github.com/nvie/vimrc/master/vimrc 
"https://github.com/derekwyatt/vim-config/blob/master/vimrc
"http://nvie.com/posts/how-i-boosted-my-vim/
"https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"http://blog.sanctum.geek.nz/vim-annoyances/
"




