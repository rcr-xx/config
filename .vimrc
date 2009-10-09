" ===========================================================================================
"                                    CONFIGURATION
" ===========================================================================================
set nocompatible  " Rend Vim non compatible avec Vi
set shiftwidth=4  " Défini 4 espace comme taille d'indentation
set tabstop=2     " Défini 2 espace commet taille d'indentation
set softtabstop=2 " Nombre d'espaces qu'un <Tab> ou <RetArr> représentent
set expandtab     " Insère un nombre approprié d'espace pour <Tab>
set smarttab      " <Tab> en début de ligne, insère blancs selon shiftwidth sinon tabstop
set smartindent   " Indentation des mots de l'option 'cinwords'
set backspace=indent,eol,start "Retour Arrière autorisé en mode Insertion pour suppression
set ruler         " Affiche en bas à droite la position du curseur
set showcmd       " Affiche en bas à droite la commande en cours de saisie
set showmode      " Affiche en bas à droite le mode actif
set showmatch     " Affiche automatiquement la parenthèse correspondante
set wrap          " Si ligne trop longue se poursuit sur ligne suivante
set incsearch     " Montre correspondance partielle du motif de recherche
set hlsearch      " Surligne les occurrences de la chaîne recherchée
set ignorecase    " Ignore la casse dans les motifs de recherche
set mouse=a       " Activation de la souris
set cursorline    " Soulignement de la ligne courante
set t_Co=256e     " Passe en 256 couleurs
set laststatus=2  " Afficher en permanence la barre d'état (en plus de la barre de commande)
set statusline=%=%f%10p%%%10c/%l  " Affiche info sur la ligne
set wildmode=list:longest " Affiche une liste identique à la complétion bash
set showtabline=2 " Affiche toujours les onglets

syntax on         " Activation de la coloration syntaxique
colorscheme zenburn

filetype on       " Detection to determine the type of the current file
filetype plugin on
au BufRead *.stl so  $VIMRUNTIME/syntax/html.vim  " Coloration des fichiers STL

function MyTabLine()
	  let s = ''
	  for i in range(tabpagenr('$'))
	    " select the highlighting
	    if i + 1 == tabpagenr()
	      let s .= '%#errorMsg#'
	    else
	      let s .= '%#Tab#'
	    endif

	    " set the tab page number (for mouse clicks)
	    let s .= '%' . (i + 1) . 'T'

	    " the label is made by MyTabLabel()
	    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
	  endfor

	  " after the last tab fill with TabLineFill and reset tab page nr
	  let s .= '%#TabLineFill#%T'

	  " right-align the label to close the current tab page
	  if tabpagenr('$') > 1
	    let s .= '%=%#TabLine#%999X X '
	  endif

	  return s
	endfunction

function MyTabLabel(n)
	  let buflist = tabpagebuflist(a:n)
	  let winnr = tabpagewinnr(a:n)
	  let buffername = bufname(buflist[winnr - 1])
    let filename = fnamemodify(buffername, ':t')
    if filename == ''
        let filename = 'noname'
    endif
    for bufnr in buflist
        if getbufvar(bufnr, "&modified")
          let filename = '!'.filename
          break
        endif
    endfor
    "Only show the first 18 letters of the name and
    ".. if the filename is more than 20 letters long
    let ret = ''
    if strlen(filename) >= 18
        let ret .= '['.filename[0:17].'..]'
    else
        let ret .= '['.filename.']'
    endif
    return ret

	endfunction

set tabline=%!MyTabLine()

" Tag les classes de pvxcore
set tag=~/sandboxes/PvxCoreApplication/tags
let Tlist_Exit_OnlyWindow=1

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
map <M-Left> gT
map <M-Right> gt
map <M-t> :tabnew<CRW:e 


noremap <C-k> <C-E>  " Déplace 1/2 écran vers le haut
noremap <C-j> <C-Y>  " Déplace 1/2 écran vers le bas
noremap <M-K> <C-U>  " Déplace 1/2 écran vers le haut
noremap <M-J> <C-D>  " Déplace 1/2 écran vers le bas
noremap <silent> <F8> :TlistToggle<CR>  " Open class navigator

imap ,ppr  from pprint import pprint<CR>pprint()<Esc>i
imap ,pgr  print '\033[1;42m',  , '\033[1;m'<Esc>12hi
imap ,pre  print '\033[1;41m',  , '\033[1;m'<Esc>12hi
imap ,pbr  print '\033[1;43m',  , '\033[1;m'<Esc>12hi
imap ,pbl  print '\033[1;44m',  , '\033[1;m'<Esc>12hi
imap ,pma  print '\033[1;45m',  , '\033[1;m'<Esc>12hi
imap ,pcy  print '\033[1;46m',  , '\033[1;m'<Esc>12hi
imap ,pgr  print '\033[1;47m',  , '\033[1;m'<Esc>12hi
imap ,pdb  import pdb; pdb.set_trace()
imap ,hea  # -*- coding: UTF-8 -*-<CR><CR># Import from standard library<CR><CR># Import from Zope<CR><CR># Import from PvxCoreApplication<CR><CR><CR>from Products.PvxCoreApplication.PvxFactory import parser_module_pour_creer_arbre_architectural<CR>parser_module_pour_creer_arbre_architectural(__name__)
imap ,gpdb import pdb, sys; pdb.Pdb(stdin=getattr(sys,'__stdin__'),stdout=getattr(sys,'__stderr__')).set_trace(sys._getframe().f_back)

" ===============================================================================================
" ===============================================================================================



