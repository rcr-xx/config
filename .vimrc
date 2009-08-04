" ===========================================================================================
"                                    CONFIGURATION
" ===========================================================================================
set nocompatible  "Rend Vim non compatible avec Vi
set shiftwidth=4  "Défini 4 espace comme taille d'indentation
set tabstop=2     "Défini 2 espace commet taille d'indentation
set softtabstop=2 "Nombre d'espaces qu'un <Tab> ou <RetArr> représentent
set expandtab     "Insère un nombre approprié d'espace pour <Tab>
set smarttab      "<Tab> en début de ligne, insère blancs selon shiftwidth sinon tabstop
set smartindent   "Indentation des mots de l'option 'cinwords'
set backspace=indent,eol,start "Retour Arrière autorisé en mode Insertion pour suppression
set ruler         "Affiche en bas à droite la position du curseur
set showcmd       "Affiche en bas à droite la commande en cours de saisie
set showmode      "Affiche en bas à droite le mode actif
set showmatch     "Affiche automatiquement la parenthèse correspondante
set wrap          "Si ligne trop longue se poursuit sur ligne suivante
set incsearch     "Montre correspondance partielle du motif de recherche
set hlsearch      "Surligne les occurrences de la chaîne recherchée
set ignorecase    "Ignore la casse dans les motifs de recherche
set mouse=a       "Activation de la souris
set cursorline    "Soulignement de la ligne courante
syntax on         "Activation de la coloration syntaxique
colorscheme evening
set laststatus=2  " Afficher en permanence la barre d'état (en plus de la barre de commande)
set statusline=%=%f%10p%%%10c/%l
filetype on       "Detection to determine the type of the current file
filetype plugin on

" Surligne les espaces de fin de ligne
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Copier/coller avec souris
function! Paste(...)
    if (exists ("a:1"))
        if a:1 == "on"
            let b:fo = &formatoptions
            let b:ai = &autoindent
            let b:si = &smartindent
            exe ':set formatoptions='
            exe ':set noautoindent'
            exe ':set nosmartindent'
            echo "autoformatting disabled: you can safely mouse-paste"
        elseif a:1 == "off"
            exe ':set formatoptions='.b:fo
            if b:ai == 1
                exe ':set autoindent'
            endif
            if b:si == 1
                exe ':set smartindent'
            endif
            echo 'autoformatting options restored'
        endif
    else
        echo 'usage: :Paste on|off'
    endif
endfunction
:com! -nargs=* Paste call Paste()

" Git grep dans vim
func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? GO call GitGrep(<f-args>)

" ===============================================================================================
" ===============================================================================================


" ===============================================================================================
"                                      HOTKEYS
" ===============================================================================================
map <F3> :s/^/#<CR>    " Commente le bloc sélectionné
map <F4> :s/^#//<CR>  " Décommente le bloc sélectionné
map <F5> :set paste!<Bar>set paste?<CR>
map <F6> :set number!<Bar>set number?<CR>
map <F7>  :%s/  *$//<CR>
noremap <M-K> <C-U>  " Déplace 1/2 écran vers le haut
noremap <M-J> <C-D>  " Déplace 1/2 écran vers le bas
nnoremap <silent> <F8> :TlistToggle<CR>  " Open class navigator
noremap <C-T> :tabnew<CR>
noremap <C-l> :tabnext<CR>
noremap <C-h> :tabprevious<CR>
noremap <C-j> :tabfirst<CR>
noremap <C-k> :tablast<CR>
noremap <C-w> :tabclose<CR>
imap ,pprint from pprint import pprint<CR>pprint()<Esc>i
imap ,print print '\033[1;42m',  , '\033[1;m'<Esc>12hi
imap ,pdb import pdb; pdb.set_trace()

" ===============================================================================================
" ===============================================================================================



