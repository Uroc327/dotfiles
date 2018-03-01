" vim: set et sw=2:

hi clear Normal
set background=light

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

hi Normal                                          guifg=#F8F8F8 guibg=#1B1B1B
hi Type                     ctermfg=2              guifg=#8EB33B
hi Statement                ctermfg=130            guifg=#AF5F00
hi Comment                  ctermfg=4              guifg=#72B3CC
hi Constant                 ctermfg=1              guifg=#C75646
hi Special                  ctermfg=9              guifg=#E09690
hi PreProc                  ctermfg=5              guifg=#C8A0D1
hi Visual      term=reverse             ctermbg=8                guibg=#5D5D5D
hi Search      term=reverse ctermfg=0   ctermbg=3  guifg=#1B1B1B guibg=#D0B03C
hi SearchBlink term=reverse ctermfg=0   ctermbg=13 guifg=#1B1B1B guibg=#FBB1F9
hi NonText                  ctermfg=6              guifg=#218693
hi SpecialKey               ctermfg=6              guifg=#218693
hi DiffAdd                  ctermfg=10  ctermbg=2  guifg=#1B1B1B guibg=#8EB33B
hi DiffChange               ctermfg=13  ctermbg=5  guifg=#1B1B1B guibg=#C8A0D1
hi DiffDelete                                      guifg=#1B1B1B guibg=#C75646
hi DiffText                                        guifg=#1B1B1B guibg=#218693
hi Todo                     ctermfg=170            guifg=#C678DD

" folding
" matchparen

let colors_name = "smyck_custom"

