
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Nov 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
 
  " Update VIMRC automatisch 
  autocmd bufwritepost .vimrc source $MYVIMRC  

else
  
" set cindent
set autoindent		" always set autoindenting on

endif " has("autocmd")

" Open .vimrc with shortcut
nmap <leader>v :vsp $MYVIMRC<CR>

" execute a perl script right here in vim
nmap <leader>p :!perl %<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" Setze tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set textwidth=79

" Setze Zeilennumerierung
set nu

" Setze Rechtschreibung auf Deutsch
set spell spelllang=de
set nospell

" Relative Zeilennumerierung
" set relativenumber

" Textumbruch
set wrap lbr nolist
set showbreak=…

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59


" Backup verzeichnis
set bdir=~/.vim/backup
set nobackup

" Always show the status line
set laststatus=2

" The command line height.
set cmdheight=2

" Setze Dateiformat in dieser Reihenfolge
set fileformats=unix,dos,mac

" Wildmenu einschalten
set wildmenu
set wildchar=<Tab>
set wildmode=full

set guifont=Monospace\ 10

"Highlighten der Cursorline
set cul

"Leerzeichenanstatt Tabs
set expandtab

"kein folding
set nofoldenable

" Arbeitsverzeichnis auf ort der Datei legen
autocmd BufEnter * silent! lcd %:p:h

"Definiert das Colorscheme -- desert -- Global.
set t_Co=256
set background=light
colorscheme default 
if &term =~ "xterm\\|rxvt"
set background=dark
colorscheme desert
endif
"if (&term=="rxvt-unicode-256color" || &term=="screen")
"endif

"Speichern auf F2 legen
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>a

nmap <F3> :BufstopFast<CR>
imap <F3> <ESC>:BufstopFast<CR>a

imap <F4> <ESC>:w<CR>:bn<CR>
nmap <F4> :w<CR>:bn<CR>

nmap <F5> :nohls<CR>
imap <F5> <ESC>:nohls<CR>a

nmap <F6> :w<CR>:make<CR>
imap <F6> <ESC>:w<CR>:make<CR>

nmap <F7> :w<CR>:make program<CR>
imap <F7> <ESC>:w<CR>:make program<CR>

" Die brauche nicht mehr dank Eclim ;-)
"nmap <F6> :cl<CR>
"imap <F6> <ESC>:cl<CR>

"nmap <F7> :cp<CR>
"imap <F7> <ESC>:cp<CR>

"nmap <F8> :cn<CR>
"imap <F8> <ESC>:cn<CR>

nnoremap <F9> :GundoToggle<CR>

imap <F10>  <ESC>:TlistToggle<CR>i
nmap <F10>  :TlistToggle<CR>

imap <F11>  <ESC>:NERDTreeToggle<CR>i
nmap <F11>  :NERDTreeToggle<CR>


" Zwingt mich hjkl zu nutzen
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk


"jj verhält sich im commandmode wie <ESC> 
inoremap jj <ESC>

"Kommentare
"imap <F7> <ESC>0i//
"nmap <F7> 0i//<ESC>

"imap <F8> <ESC>0xxi
"nmap <F8> 0xx<ESC>

" Anpassungen für eclim
set guioptions-=m " turn off menu bar
"set guioptions-=T " turn off toolbar
set guioptions-=L " turn off left scrollbar
set guioptions-=l

"Eclipse-Plugin browser...
let g:EclimBrowser = 'google-chrome'

"Klammern automatisch schliessen
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}

"Ersetzungen im Eingabe-MOdus
"iab #i #include
"iab #d #define

"clang-plugin option => c vervollstaendigung
set completeopt=menu,longest

"Cursorfarbe im terminal
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

"Cursorform im terminal
if &term =~ "^xterm\\|^rxvt"
  " solid underscore
  let &t_SI .= "\<Esc>[3 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
endif


" <-- Dateien in einem Git-Projek anzeigen
" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  "let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  let fname = Chomp(system("ls | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

"Fkt. Auf <- Ctrl f gelegt
map <c-f> :call DmenuOpen("e")<cr>

"Wenn x68 dann setze Highlight auf asm
au BufNewFile,BufRead *.x68 set filetype=asm

set cot-=preview

au FileType mail let b:delimitMate_autoclose = 0

