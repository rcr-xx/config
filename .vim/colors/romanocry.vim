" Vim color file

set background=light
hi clear
if exists("syntax_on")
    syntax reset
    hi clear
endif
let g:colors_name="romanocry"


hi Comment          ctermfg=4

hi ErrorMsg         ctermfg=229   ctermbg=236   cterm=bold
hi Error            ctermfg=229   ctermbg=236   cterm=bold

hi IncSearch        ctermfg=227   ctermbg=236   cterm=bold
hi Search           ctermfg=236   ctermbg=227   cterm=bold

hi LineNr           ctermfg=238   ctermbg=186   cterm=none
hi StatusLine       ctermfg=186   ctermbg=238   cterm=bold
hi CursorLine                                   cterm=underline

hi TabLineFill      ctermfg=186   ctermbg=238   cterm=none
hi TabSelected      ctermfg=238   ctermbg=186   cterm=bold
hi TabNotSelected   ctermfg=186   ctermbg=238   cterm=bold

hi String           ctermfg=22                  cterm=none
hi Conditional      ctermfg=94                  cterm=bold
hi Function                       ctermfg=none  cterm=none
hi Operator         ctermfg=94                  cterm=bold
hi Statement        ctermfg=94                  cterm=bold
hi KeyWord          ctermfg=94                  cterm=bold
hi Typedef          ctermfg=94                  cterm=bold
hi PreProc          ctermfg=94                  cterm=bold
hi Number           ctermfg=5                 cterm=none

hi vertsplit        ctermbg=red
hi pythonSpaceError ctermbg=red
hi WarningMsg       ctermbg=red   ctermfg=black
hi SpellBad         ctermfg=232   ctermbg=red   cterm=bold

hi TrailingWhitespace             ctermbg=red
hi LineTooLong                                 cterm=bold

match LineTooLong /\%80v.\+/        " Surligne lignes de + de 80 caractères
2match TrailingWhitespace /\s\+$/   " Surligne les espaces de fin de ligne

