
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

else
  
" set cindent
set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" Setze tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=79

" Setze Zeilennumerierung
set nu

" Relative Zeilennumerierung
set relativenumber

" Backup verzeichnis
set bdir=~/.vim/backup

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

set guifont=Monospace\ 14

"Highlighten der Cursorline
set cul

"Leerzeichenanstatt Tabs
set expandtab

" Arbeitsverzeichnis auf ort der Datei legen
autocmd BufEnter * silent! lcd %:p:h

"Definiert das Colorscheme -- desert -- Global.
colorscheme default "desert

"Speichern auf F2 legen
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>a

imap <F4> <ESC>:w<CR>:bn<CR>
nmap <F4> :w<CR>:bn<CR>

nmap <F5> :w<CR>:make<CR>
imap <F5> <ESC>:w<CR>:make<CR>

nmap <F6> :cl<CR>
imap <F6> <ESC>:cl<CR>

nmap <F7> :cp<CR>
imap <F7> <ESC>:cp<CR>

nmap <F8> :cn<CR>
imap <F8> <ESC>:cn<CR>

nmap <F12> :w<CR>:!gnome-terminal --maximize -e "./$(basename % .c)"<CR>
imap <F12> <ESC>:w<CR>:!gnome-terminal --maximize -e "./$(basename % .c)"<CR>

imap <F9>  <ESC>:TlistToggle<CR>i
nmap <F9>  :TlistToggle<CR>

imap <F10>  <ESC>:NERDTreeToggle<CR>i
nmap <F10>  :NERDTreeToggle<CR>

imap <F11>  <ESC>:!gnome-terminal --maximize<CR>
nmap <F11>  :!gnome-terminal --maximize<CR>

"Kommentare
"imap <F7> <ESC>0i//
"nmap <F7> 0i//<ESC>

"imap <F8> <ESC>0xxi
"nmap <F8> 0xx<ESC>



"Klammern automatisch schliessen
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

"Ersetzungen im Eingabe-MOdus
iab #i #include
iab #d #define

