" Remove ALL autocommands for the current group
:autocmd!


" Enable pathogen
execute pathogen#infect()
"call pathogen#runtime_append_all_bundles()

runtime macros/matchit.vim

set encoding=utf-8 " Encodage par defaut
set nocompatible " Pas de compatibilité vi
set bs=indent,start,eol " retour en arrière simplifié
set ruler " Affiche la position du curseur en bas à droite
set autoindent " Active l'autoindentation
set history=20 " Garde 20 commende dans l'historique
set expandtab
set tabstop=2 " 2 espace par tabulation
set shiftwidth=2 " 2 espace par auto indentation
set softtabstop=2
set scrolloff=2 " Garder toujours 2 ligne au dessus et dessous du curseur
set hlsearch " Surligner le terme recherché
set number " afficher les numéro des lignes
set title " afficher le nom du fichier dans le titre de la console

" numerotation des lignes
highlight LineNr ctermbg=grey ctermfg=black

" Map la touche <F8> pour switcher entre action et template symfony
silent map <F8> :SfSwitchView <CR>

" ShowFunc key binding
map   <F7> <Plug>ShowFunc
map!  <F7> <Plug>ShowFunc

" menu
set wildmenu
set wildignore=*.o,*#,*~,*.dll,*.so,*.a
set wildmode=full

" amélioration de la lisibilité des onglets
highlight TabLine term=none cterm=none
highlight TabLineSel ctermbg=darkblue

" ajout d'une ligne colorée sous le curseur
set cursorline
highlight CursorLine term=reverse cterm=reverse

" coloration schema
colorscheme default

syntax on " Coloration syntaxique


" Status line
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic
let g:syntastic_enable_signs=1
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=1


" Lier le plugin closetag au fichier html, xml, xsl et php
au Filetype html,xml,xsl,php source ~/.vim/plugin/closetag.vim
"filetype on
"filetype plugin on
let php_folding = 1

" Lier le plugin PHP Doc
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

autocmd BufRead * silent! %s/[\r \t]\+$//
" autocmd BufEnter * .php :%s/[ \t\r]\+$//e

"set list
"set listchars=trail:-

filetype on
filetype plugin on
filetype plugin indent on

" Activation de la correction grammaticale
let g:languagetool_jar=$HOME .'/software/languagetool/1.5/LanguageTool.jar'
let g:languagetool_disable_rules="FRENCH_WHITESPACE,WHITESPACE_RULE,FIXTURE,EMAIL"
setlocal spell spelllang=fr
set nospell

" Save a file you edited in vim without the needed permissions
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

