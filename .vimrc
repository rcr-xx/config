" =========================================================================================== "
"                          CONFIG POUR DEVELOPPEMENT PYTHON                                   "
" =========================================================================================== "

set nocompatible                 " Rend Vim non compatible avec Vi
set shiftwidth=4                 " Nombre de caractère utilisé pour l'indentation
set tabstop=4                    " Nombre d'espace par tab
set softtabstop=2                " Pour que backspace supprime 4 espaces
set expandtab                    " Insère un nombre approprié d'espace pour <Tab>
set smarttab                     " <Tab> en début de ligne, insère blancs selon shiftwidth sinon tabstop
set smartindent                  " Indentation des mots de l'option 'cinwords'
set backspace=indent,eol,start   " Retour Arrière autorisé en mode Insertion pour suppression
set ruler                        " Affiche en bas à droite la position du curseur
set showcmd                      " Affiche en bas à droite la commande en cours de saisie
set showmode                     " Affiche en bas à droite le mode actif
set showmatch                    " Affiche automatiquement la parenthèse correspondante
set wrap                         " Si ligne trop longue se poursuit sur ligne suivante
set incsearch                    " Montre correspondance partielle du motif de recherche
set hlsearch                     " Surligne les occurrences de la chaîne recherchée
set ignorecase                   " Ignore la casse dans les motifs de recherche
set mouse=a                      " Activation de la souris
set cursorline                   " Soulignement de la ligne courante
set t_Co=256e                    " Passe en 256 couleurs
set laststatus=2                 " Afficher en permanence la barre d'état (en plus de la barre de commande)
set statusline=%=%f%10p%%%10c/%l " Affiche info sur la ligne
set wildmode=list:longest        " Affiche une liste identique à la complétion bash
set showtabline=2                " Affiche toujours les onglets
set lcs:tab:>-,trail:.           " Affiche les tabs, les ' ' en fin de ligne et les \n
set nu                           " Affiche les numéros de ligne
set autowrite                    " Enregistre avant compilation, grep...
set syntax=rest                  " Coloration des fichier rst
syntax on                        " Activation de la coloration syntaxique
colorscheme romanocry            " Thème vim
filetype on                      " Detection to determine the type of the current file
filetype plugin on               " For plugin Pyflakes
filetype plugin indent on        " For plugin Pyflakes
au BufRead *.stl so  $VIMRUNTIME/syntax/html.vim  " Coloration des fichiers STL
let g:pydiction_location = '~/.vim/ftplugin/pydiction-1.2/complete-dict'

" =============================================================================================== "
"                                  HOTKEYS                                                        "
" =============================================================================================== "

"          <F1> Aide Gnome
" Commente/Decommente le bloc sélectionné
map        <F2>  :python python_comment()<CR>
map        <F3>  :python python_uncomment()<CR>
" Free     <F4>
" Free     <F5>
" Free     <F6>
" Supprime les trailing whitespace
map        <F7> :%s/  *$//<CR>:echo '!!! Trailing whitespace cleaned !!!'<CR>
" Affiche navigateur du fichier
noremap    <silent> <F8> :TlistToggle<CR>
"          <F9> Free
" Recharge les onglets
map        <F9> :tabdo :e!<CR>:echo '!!! Tabs reloded !!!'<CR>
"          <F11> Agrandi la fenêtre
" Recharge configuration vim
map        <F12> :source ~/.vimrc<CR>:echo '!!! Config reloaded !!!'<CR>
" Ferme l'onglet courant
map        <C-D> :tabclose!<CR>
" Ouvre nouvel onglet
noremap    <C-T> :tabnew<CR>:tabm<CR>
" Passe sur l'onglet de gauche
noremap    <C-H> gT
" Passe sur l'onglet de droite
noremap    <C-L> gt
" Copier dans presse papier système
vmap       <C-Y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
" Coller presse papier système
nmap       <C-P> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
" Recherche le mot sous le curseur
noremap    gg       yiw:call GitGrepWordUnderCursor()<CR>
" Remplace double quote par simple quote
noremap    ""  :s/\"/\'/g<CR><ESC>: echo'!!! " cleaned !!!'<CR>
" Rend code conforme à PEP8
noremap    88 :python clean_syntax()<CR><ESC>: echo '!!! Syntax cleaned !!!'<CR>
" Met en session et quitte tous les buffers
command!   Session  silent :mksession! ~/.vim/session.vim | :wqa
" Affiche les couleurs en fonction de la syntaxe
command!   Color    :source $VIMRUNTIME/syntax/hitest.vim
" MAJ du wiki provexi en local
command!   MajWiki  :!cd ~/sandboxes/PvxCoreApplication/doc;make html
" GitGrep dans un nouvel onglet
command!   -nargs=*                                       GG  call GG(<q-args>)
" GitDiff dans un nouvel onglet
command!   -nargs=* -complete=customlist,ListGitCommits   GD  call GD(<q-args>)
imap       ,ppr  from pprint import pprint<CR>pprint()<Esc>i
imap       ,pgr  print '\033[1;42m',  , '\033[1;m'<Esc>12hi
imap       ,pre  print '\033[1;41m',  , '\033[1;m'<Esc>12hi
imap       ,pbr  print '\033[1;43m',  , '\033[1;m'<Esc>12hi
imap       ,pbl  print '\033[1;44m',  , '\033[1;m'<Esc>12hi
imap       ,pma  print '\033[1;45m',  , '\033[1;m'<Esc>12hi
imap       ,pcy  print '\033[1;46m',  , '\033[1;m'<Esc>12hi
imap       ,pdb  import pdb; pdb.set_trace()
map        ,try  <Esc>otry:<Esc>oexcept:<ESC>oimport pdb; pdb.set_trace()<ESC>kkkddp>>j<<
map        ,dtr <Esc>dd<<jdddd
imap       ,gpdb import pdb, sys; pdb.Pdb(stdin=getattr(sys,'__stdin__'),stdout=getattr(sys,'__stderr__')).set_trace(sys._getframe().f_back)
imap       ,hea  # -*- coding: UTF-8 -*-<CR><CR># Import from standard library<CR><CR># Import from Zope<CR><CR># Import from PvxCoreApplication<CR><CR><CR>from Products.PvxCoreApplication.PvxFactory import parser_module_pour_creer_arbre_architectural<CR>parser_module_pour_creer_arbre_architectural(__name__)


" =============================================================================================== "
"                                  FUNCTIONS                                                      "
" =============================================================================================== "

function! MyTabLine()
	  let s = ''
	  for i in range(tabpagenr('$'))
	    " select the highlighting
	    if i + 1 == tabpagenr()
	      let s .= '%#TabSelected#'
	    else
	      let s .= '%#TabNotSelected#'
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

function! MyTabLabel(n)
	  let buflist = tabpagebuflist(a:n)
	  let winnr = tabpagewinnr(a:n)
	  let buffername = bufname(buflist[winnr - 1])
    let filename = fnamemodify(buffername, ':t')
    if filename == ''
        let filename = 'noname'
    endif
    "Only show the first 18 letters of  the name and
    ".. if the filename is more than 20 letters long
    let ret = ''
    let ret = matchstr (filename, ".[^.]*")
    if strlen(ret) >= 16
        let ret = ret[0:15].'..'
    endif
    for bufnr in buflist
        if getbufvar(bufnr, "&modified")
          let ret = '!'.ret
          break
        endif
    endfor
    let tab_num = a:n - 1
    let ret = '['.tab_num.'.'.ret.']'
    return ret
	endfunction

set tabline=%!MyTabLine()

python << EOF
import vim
import re
def clean_syntax():
    patterns = [
        {'regexp': ' *,',
         'replace': r','},
        {'regexp': ',  *',
         'replace': r', '},
        {'regexp': ',([^ ])',
         'replace': r', \1'},
        {'regexp': ' *: *',
         'replace': r': '},
        {'regexp': ':([^ ])',
         'replace': r': \1'},
        {'regexp': '(\[|{|\() *',
         'replace': r'\1'},
        {'regexp': '([^ ]) *(\]|}|\))',
         'replace': r'\1\2'},
        {'regexp': '  *$',
         'replace': r''},
        ]
    r = vim.current.range
    b = vim.current.buffer
    for num_line in range(r.start, r.end+1):
        for pattern in patterns:
            b[num_line] = re.sub(
                pattern['regexp'],
                pattern['replace'],
                b[num_line])
EOF

python << EOF
import vim
import re
def python_comment():
    r = vim.current.range
    b = vim.current.buffer
    m = re.search('[^ ]', b[r.start])
    index = m.start() if m else 0
    for num_line in range(r.start, r.end+1):
        b[num_line] = '%s#%s' %(b[num_line][0:index], b[num_line][index:])
EOF

python << EOF
import vim
import re
def python_uncomment():
    r = vim.current.range
    b = vim.current.buffer
    for num_line in range(r.start, r.end+1):
        b[num_line] = re.sub('(^ *)#', r'\1', b[num_line])
EOF

" Tag les classes de pvxcore
set tag=~/sandboxes/PvxCoreApplication/tags
let Tlist_Exit_OnlyWindow=1

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

" Grep dans un nouvel onglet
function! GG(args)
    execute 'tabnew'
    execute 'tabm'
    call GitGrep(a:args)
endfunction

" Grep du mot sous le curseur dans un nouvel onglet
function! GitGrepWordUnderCursor()
    execute 'tabnew'
    execute 'tabm'
    let a = @
    call GitGrep(a)
endfunction

" GitDiff dans un nouvel onglet
function! GD(args)
    execute 'tabnew'
    execute 'tabm'
    call GitDiff(a:args)
    "execute 'exit'
endfunction


" =============================================================================================== "
"                                      SETUP                                                      "
" =============================================================================================== "

" ==> A partir des paquets
" sudo apt-get install vim-gnome exuberant-ctags
"
" ==> A partir du code source
" sudo apt-get build-dep vim-gnome
" hg clone https://vim.googlecode.com/hg/ vim
" cd vim/src
" ./configure \
"   --enable-pythoninterp=yes \
"   --enable-python3interp=yes \
"   --enable-rubyinterp \
"   --enable-perlinterp=yes \
"   --enable-tclinterp \
"   --enable-cscope \
"   --enable-sniff \
"   --enable-multibyte \
"   --enable-gtk2-check=yes \
"   --enable-gui=auto \
"   --enable-fontset \
"   --with-x \
"   --with-features=huge
" make
" make install

" Installer xclip pour permettre de faire des copier/coller avec Ctrl-C et Ctrl-V

" =============================================================================================== "
"                                      PLUGINS                                                    "
" =============================================================================================== "

" ==> Zenburn :
"    * Fonction : colorsheme
"    * Url : http://www.vim.org/scripts/script.php?script_id=415

" ==> Taglist : menu de navigation de la classe courante
"    * Fonction : rajoute sur la gauche de l'écran un menu de navigation de la classe courante
"    * URL : http://sourceforge.net/project/showfiles.php?group_id=181103
"    * Installation :
"         - Décompresser le plugin dans ~/.vim
"         - $ cd ~/.vim/doc
"         - $ vim
"         - :helptags .

" ==> Pyflakes
"    * Fonction : Vérifie syntaxe python
"    * URL : www.vim.org/scripts/script.php?script_id=2441
"    * Installation :
"         - Récupérer et dézipper dans ~/.vim/ftplugin/python

" ==> Git-vim
"    * Fonction : Commandes git sous vim
"    * URL : git.jukie.net/git-vim.git
"    * Installation :
"         - $ cd ~/.vim
"         - $ git clone git://git.jukie.net/git-vim.git

" ==> Align
"    * Fonction : Alignement du texte
"    * URL : http://www.vim.org/scripts/script.php?script_id=294

" ==> NERDTree
"    * Fonction : Exploreur de filesystem
"    * URL : http://www.vim.org/scripts/script.php?script_id=1658
"    * Installation :
"         - Décompresser le plugin dans ~/.vim"

" ==> Pep8
"    * Fonction : Vérifie si code python respecte PEP8
"    * URL : http://www.vim.org/scripts/script.php?script_id=2914
"    * Installation :
"         - Installer préalablement pep8.py : easy_install pep8

" ==> RestructuredText
"    * Fonction : Coloration syntaxique des fichiers rst
"    * URL : http://www.vim.org/scripts/script.php?script_id=973
"    * Installation :
"        - Dézipper dans le répertoire ~/.vim/syntax


" =============================================================================================== "
"                                     HELP                                                        "
" =============================================================================================== "

" ==> TAG
"   Tag stack
"   * :tj / --> Recherche le tag après le /
"   * :po --> Revenir à l'écran précédent

" ==> Comment installer un vimball?
"   1. vim tail-03.vba
"   2. :so %
"
" ==> Spilt and scroll simultaneously
"  :set scb!      #scrollbind
"
" ==> Rechercher / remplacer dans un répertoire
" find . -name "*.py" -exec sed -i 's/toto/tata/g' {}\;
