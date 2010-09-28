" Vim color file

set background=light
hi clear
if exists("syntax_on")
    syntax reset
    hi clear
endif
let g:colors_name="romanocry"

"hi Comment ctermbg=red ctermfg=darkgrey guibg=#000000 guifg=#777777
hi Comment         ctermfg=246 
hi Conditional     ctermfg=21 
hi CursorLine                                  cterm=underline
hi ErrorMsg        ctermfg=229   ctermbg=236   cterm=bold
hi IncSearch       ctermfg=238   ctermbg=red
hi LineNr          ctermfg=246   ctermbg=186   cterm=bold
hi Search          ctermfg=236   ctermbg=227   cterm=bold
hi StatusLine      ctermfg=236   ctermbg=186
hi TabLineFill     ctermfg=236   ctermbg=186   cterm=bold
hi TabSelected     ctermfg=236   ctermbg=186   cterm=bold


"    hi Boolean         ctermfg=181
"    hi Character       ctermfg=181   cterm=bold
"    hi Comment         ctermfg=108
"    hi Conditional     ctermfg=223   cterm=bold
"    hi Constant        ctermfg=181   cterm=bold
"    hi Cursor          ctermfg=233   ctermbg=109     cterm=bold
"    hi Debug           ctermfg=181   cterm=bold
"    hi Define          ctermfg=223   cterm=bold
"    hi Delimiter       ctermfg=245
"    hi DiffAdd         ctermfg=66    ctermbg=237     cterm=bold
"    hi DiffChange      ctermbg=236
"    hi DiffDelete      ctermfg=236   ctermbg=238
"    hi DiffText        ctermfg=217   ctermbg=237     cterm=bold
"    hi Directory       ctermfg=188   cterm=bold
"    hi ErrorMsg        ctermfg=115   ctermbg=236     cterm=bold
"    hi Exception       ctermfg=249   cterm=bold
"    hi Float           ctermfg=251
"    hi FoldColumn      ctermfg=109   ctermbg=238
"    hi Folded          ctermfg=109   ctermbg=238
"    hi Function        ctermfg=228
"    hi Identifier      ctermfg=223
"    hi IncSearch       ctermbg=228   ctermfg=238
"    hi Keyword         ctermfg=223   cterm=bold
"    hi Label           ctermfg=187   cterm=underline
"    hi Macro           ctermfg=223   cterm=bold
"    hi ModeMsg         ctermfg=223   cterm=none
"    hi MoreMsg         ctermfg=15    cterm=bold
"    hi Number          ctermfg=116
"    hi Operator        ctermfg=230
"    hi PreCondit       ctermfg=180   cterm=bold
"    hi PreProc         ctermfg=223   cterm=bold
"    hi Question        ctermfg=15    cterm=bold
"    hi Repeat          ctermfg=223   cterm=bold
"    hi Search          ctermfg=230   ctermbg=236
"    hi SpecialChar     ctermfg=181   cterm=bold
"    hi SpecialComment  ctermfg=108   cterm=bold
"    hi Special         ctermfg=181
"    hi SpecialKey      ctermfg=151
"    hi Statement       ctermfg=187   ctermbg=234     cterm=none
"    hi StatusLine      ctermfg=236   ctermbg=186
"    hi StatusLineNC    ctermfg=235   ctermbg=108
"    hi StorageClass    ctermfg=249   cterm=bold
"    hi String          ctermfg=174
"    hi Structure       ctermfg=229   cterm=bold
"    hi Tag             ctermfg=181   cterm=bold
"    hi Title           ctermfg=7     ctermbg=234     cterm=bold
"    hi Todo            ctermfg=108   ctermbg=234     cterm=bold
"    hi Typedef         ctermfg=253   cterm=bold
"    hi Type            ctermfg=187   cterm=bold
"    hi Underlined      ctermfg=188   ctermbg=234     cterm=bold
"    hi VertSplit       ctermfg=236   ctermbg=65
"    hi VisualNOS       ctermfg=236   ctermbg=210     cterm=bold
"    hi WarningMsg      ctermfg=15    ctermbg=236     cterm=bold
"    hi WildMenu        ctermbg=236   ctermfg=194     cterm=bold
"    hi SpellLocal ctermfg=14  ctermbg=237
"    hi SpellBad   ctermfg=9   ctermbg=237
"    hi SpellCap   ctermfg=12  ctermbg=237
"    hi SpellRare  ctermfg=13  ctermbg=237
"
"    " pmenu
"    hi PMenu      ctermfg=248  ctermbg=0
"    hi PMenuSel   ctermfg=223 ctermbg=235
"
"    if exists("g:zenburn_high_Contrast")
"        hi Normal ctermfg=188 ctermbg=234
"        hi NonText         ctermfg=238
"
"        if exists("g:zenburn_color_also_Ignore")
"            hi Ignore          ctermfg=238
"        endif
"    else
"        hi Normal ctermfg=188 ctermbg=237
"        hi Cursor          ctermbg=109
"        hi diffadd         ctermbg=237
"        hi diffdelete      ctermbg=238
"        hi difftext        ctermbg=237
"        hi errormsg        ctermbg=237
"        hi foldcolumn      ctermbg=238
"        hi folded          ctermbg=238
"        hi incsearch       ctermbg=228
"        hi linenr          ctermbg=238
"        hi search          ctermbg=238
"        hi statement       ctermbg=237
"        hi statusline      ctermbg=144
"        hi statuslinenc    ctermbg=108
"        hi title           ctermbg=237
"        hi todo            ctermbg=237
"        hi underlined      ctermbg=237
"        hi vertsplit       ctermbg=65
"        hi visualnos       ctermbg=210
"        hi warningmsg      ctermbg=236
"        hi wildmenu        ctermbg=236
"        hi NonText         ctermfg=240
"        
"        if exists("g:zenburn_color_also_Ignore")
"            hi Ignore          ctermfg=240
"        endif
"    endif
"
"    if exists("g:zenburn_alternate_Error")
"        " use more jumpy Error
"        hi Error ctermfg=210 ctermbg=52 gui=bold
"    else
"        " default is something more zenburn-compatible
"        hi Error ctermfg=228 ctermbg=95 gui=bold
"    endif
"endif
