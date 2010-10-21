" Vim color file

set bg=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="romanocry"

hi Comment          ctermfg=4                   cterm=none
hi SpecialComment   ctermfg=4                   cterm=none

hi ErrorMsg         ctermfg=229   ctermbg=236   cterm=bold
hi Error            ctermfg=229   ctermbg=236   cterm=bold

hi IncSearch        ctermfg=229   ctermbg=236   cterm=bold
hi Search           ctermfg=236   ctermbg=229   cterm=bold

hi LineNr           ctermfg=238   ctermbg=186   cterm=none
hi StatusLine       ctermfg=186   ctermbg=241   cterm=bold
hi CursorLine                                   cterm=underline

hi TabLineFill      ctermfg=186   ctermbg=241   cterm=none
hi TabSelected      ctermfg=226   ctermbg=241   cterm=bold
hi TabNotSelected   ctermfg=186   ctermbg=241   cterm=bold

hi String           ctermfg=2                   cterm=none
hi Type             ctermfg=2                   cterm=none
hi Conditional      ctermfg=130                 cterm=none
hi Function                       ctermfg=none  cterm=none
hi Operator         ctermfg=130                 cterm=none
hi Statement        ctermfg=130                 cterm=none
hi KeyWord          ctermfg=130                 cterm=none
hi Typedef          ctermfg=130                 cterm=none
hi PreProc          ctermfg=130                 cterm=none
hi Number           ctermfg=5                   cterm=none

hi vertsplit        ctermbg=130   ctermfg=130   cterm=none
hi pythonSpaceError ctermbg=9
hi WarningMsg       ctermbg=9     ctermfg=black
hi SpellBad         ctermfg=232   ctermbg=9     cterm=bold

hi TrailingWhitespace             ctermbg=9
hi LineTooLong                                  cterm=bold

match LineTooLong /\%80v.\+/        " Surligne lignes de + de 80 caractères
2match TrailingWhitespace /\s\+$/   " Surligne les espaces de fin de ligne

