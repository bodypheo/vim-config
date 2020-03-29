"Atajos de teclado:
" ,s guardado	,ev	Editar vimrc	,sv Recargar vimrc	,i Show invisible
" chars
" ,tl muestra/oculta las lﾃｭneas de cﾃｳdigo para copiar texto.
" ,e carg NerdTree
" <F2> Activa pegado (Para que no indente y no comente etc"
" Ctrl-h/j/k/l Mueve por ventanas para no tener que pulsar control+w
",em edita menu de openbox ,er edita rc de openbox
"F9 ejecuta el script de python
set nocompatible
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
"Codificación japones
"set fileencodings=iso-2022-jp,euc,jp,cp932,utf8,default,latin1
set visualbell

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"##############################################################
" Opciones bﾃ｡sicas
"##############################################################
"Autoread funciona cuando se ejecuta algﾃｺn comando en la shell. P.ej:
":checkdate o al guardar.Tambiﾃｩn se puede poner un autocmd
set autoread
"Cambia atuomáticamente al directorio del fichero abierto
"set autochdir
"Deshabilitamos los archivos de copia de seguridad
set nobackup
set noswapfile
set undofile "Guarda deshacer entre sesiones
set undodir=~/.undovim
set showtabline=2

"Configuraciones sobre busquedas.
set ignorecase "Ignora mayﾃｺsculas cuando busca
set smartcase "Ignora may si el tﾃｩrmino de busq es minﾃｺscula si tiene may no.
set incsearch "Muestra la primera coincidencia al usar la busqueda.  
set hlsearch " Resalta los tﾃｩrmnos de bﾃｺsqueda.
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
"Oculta los buffers en lugar de cerrarlos.
set hidden
"exrc http://www.ilker.de/specific-vim-settings-per-project.html
set exrc "Respeta los archivos .exrc y .vimrc locales en carpetas
set secure "Hace exrc que sea seguro.
set backspace=start,indent,eol
set mouse=r
set encoding=utf-8
"Completado al pulsar tab al usar comandos
set wildmenu
set wildmode=list:longest,full
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
nmap <silent> <leader>c :Errors<cr> 
nmap <silent> <leader>e :VimFiler<cr> 
nmap <silent> <leader>a :@:<cr>
nmap <silent> <F4> :Dict<cr>
nmap <silent> <leader>bd :call Drae()<cr>
nnoremap <leader>r :!%:p<cr>
nnoremap <leader>j :bp<cr>
nnoremap <leader>k :bn<cr>
nnoremap <leader>x :!./%<cr>

if exists('$TMUX')
		set term=screen-256color
endif
if exists('$ITERM_PROFILE')
  if exists('$TMUX') 
	  let &t_SI = "\<Esc>[3 q"
	  let &t_EI = "\<Esc>[0 q"
   else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

"Mapeado de ejecución de python
nnoremap :update<cr> <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

"Mapeamos ,s para salvado rﾃ｡pido
noremap <leader>s :update<cr>
noremap <leader>f /

"Activar, desactivar la numeracion de líneas
noremap <leader>z :set number!<cr>

"Para avance de pﾃ｡gina con espacio
map <Space> <C-d>
"Mapeo de la tecla escape:
inoremap jk <Esc>
"Impedir que mueva el cursor cuando usemos J para unir lﾃｭneas
nnoremap J mzJ'z
"Centrar la pantalla despuﾃｩs de buscar o ir al siguiente pﾃ｡rrafo
nnoremap n nzz
nnoremap } }zz

"Mapeo de gj y gh para que vaya lﾃｭnea a lﾃｭnea aunque no haya salto de lﾃｭnea
"(softwrap)
map j gj
map k gk
"Desmapeo las teclas de direcciﾃｳn para acostumbrarme a hjkl
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
"Muestra tabs y eol al pulsar la tecla lﾃｭder seguida de l
:set listchars=tab:▸\ ,eol:¬,trail:·
nmap <leader>i :set list!<CR>
" Easy window navigation
nmap <TAB> <C-w>
nmap <TAB><TAB> <C-w><C-w>
nnoremap K :q<cr>
nnoremap <left> zc
nnoremap <right> zo

"Navegar entre buffers:
:map <C-h> :bp<CR>
:map <C-l> :bn<CR> 

"Convertir mardkdown to html
nmap <leader>md :%!~/.vim/external/Markdown.pl --html4tags<cr>

"Instertar fecha
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

" Ultisnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/vim-snippets/Ultisnips']

"##############################################################
" Opciones grﾃ｡ficas
"##############################################################
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
set cursorline "Resalta el número de línea actual
"Tamaﾃｱo de tabulador:
set tabstop=4
"Cambiamos el aspecto
set laststatus=2 "Muestra la barra de estado siempre
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set statusline=
set statusline+=%02n\|
set statusline+=%-.25F
set statusline+=[%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline+=\ %{strftime(\"%H:%M\")}
set ruler "Muestra lﾃｭnea y columna 
set wrapscan
set number
set title
set foldcolumn=1
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

"Va a la ﾃｺltima posiciﾃｳn donde se encontraba el archivo cuando se cerro.
"http://nixtricks.wordpress.com/2012/01/05/vim-automatically-jump-to-the-last-visited-line-when-a-file-is-reopened/
if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif
au FocusLost * :silent! wall
set switchbuf=useopen,usetab
set vb t_vb=
"#############################################################
"Startify
"
let g:startify_custom_header = [
\'                   ___           ___           ___           ___                  ',
\'       ___        /  /\         /  /\         /  /\         /  /\           ___   ',
\'      /__/\      /  /:/        /  /::\       /  /::|       /  /::|         /__/\  ',
\'      \__\:\    /  /:/        /  /:/\:\     /  /:|:|      /  /:|:|         \__\:\ ',
\'  ___ /  /::\  /  /:/        /  /::\ \:\   /  /:/|:|__   /  /:/|:|__       /  /::\',
\' /__/\  /:/\/ /__/:/     /\ /__/:/\:\_\:\ /__/:/ |:| /\ /__/:/_|::::\   __/  /:/\/',
\' \  \:\/:/~~  \  \:\    /:/ \__\/  \:\/:/ \__\/  |:|/:/ \__\/  /~~/:/  /__/\/:/~~ ',
\'  \  \::/      \  \:\  /:/       \__\::/      |  |:/:/        /  /:/   \  \::/    ',
\'   \__\/        \  \:\/:/        /  /:/       |__|::/        /  /:/     \  \:\    ',
\'                 \  \::/        /__/:/        /__/:/        /__/:/       \__\/    ',
\'                  \__\/         \__\/         \__\/         \__\/',
\'',
\'Atajos de teclados de la semana',
\'Vimwiki: <leader>ww',
\'Buffers: <leader>j & <leader>k',
\'',
\]
let g:startify_custom_footer = [
						\'                                                                                          .__         ',
						\'                                                                                    ___  _|__| _____  ',
						\'                                                                                    \  \/ /  |/     \ ',
						\'                                                                                     \   /|  |  Y Y  \',
						\'                                                                                      \_/ |__|__|_|  /',
						\'                                                                                                   \/',
						\'',
						\]
"Configuración python_mode plugin
let g:pymode_rope = 0
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 1

"Con python mode se pueden agregar breakpoints

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"github_dashboard
let g:github_dashboard = { 'username': 'bodypheo' }

"Documentación
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_folding = 0

"vim-airline
let g:airline_powerline_fonts = 1

"vim-jedi
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = 1

"vim-pomodoro
let g:tomato#remind = " \uf003 "
let g:tomato#interval = 25 * 60
let g:tomato#restinfo = " \ufe000 "
let g:tomato#show_clock = 1

"Syntax de includes de ssh .hosts
autocmd BufNewFile,BufRead *.hosts set syntax=sshconfig

"Ctrl-P
let g:ctrlp_custom_ignore =  '^.git$\|_site'

augroup json_autocmd
	autocmd!
	autocmd FileType json set autoindent
	autocmd FileType json set formatoptions=tcq2l
	autocmd FileType json set textwidth=78 shiftwidth=4
	autocmd FileType json set softtabstop=4 tabstop=8
	autocmd FileType json set expandtab
	autocmd FileType json set foldmethod=syntax
augroup END

"
"##############################################################
" Creditos 
"##############################################################
"Steve Losh: https://bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
"https://raw.github.com/nvie/vimrc/master/vimrc 
"https://github.com/derekwyatt/vim-config/blob/master/vimrc
"http://nvie.com/posts/how-i-boosted-my-vim/
"https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"http://blog.sanctum.geek.nz/vim-annoyances/
"http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
"
"My first function WiP
function! Drae()
		let wordToSearch = expand("<cword>")
		split
		enew
		call append(0,wordToSearch)
"		echom wordToSearch
endfunction
