set background=light
hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name="neutron"

hi Cursor       guibg=#404040 guifg=#a0a0a0
hi CursorColumn guibg=#e0e0e0 guifg=#202020
hi CursorLine   guibg=#e0e0e0 guifg=#202020
hi NonText      guibg=#d0d0d0 guifg=#606060 gui=none
hi Visual       guibg=#fffac8 guifg=#404040 gui=none
hi Folded       guibg=#e8e5d0 guifg=#606060 gui=none
hi TabLineFill  guibg=#d0d0d0 guifg=#606060 gui=none
hi SpecialKey   guibg=#e8e8e8 guifg=#a0a0a0 gui=none
hi Search       guibg=#808080 guifg=#ffffff gui=bold
hi ModeMsg      guibg=#f3f2ed guifg=#304050 gui=bold
hi MoreMsg      guibg=#f3f2ed guifg=#304050 gui=bold
hi StatusLine   guibg=#808080 guifg=#f3f2ed gui=bold
hi StatusLineNC guibg=#707070 guifg=#d0d0d0 gui=none
hi VertSplit    guibg=#707070 guifg=#909090 gui=none
hi LineNr       guibg=#e8e5d0 guifg=#808080 gui=none

hi DiffAdd      guibg=#a67429 guifg=#ffcc7f
hi DiffDelete   guibg=#a62910 guifg=#ff7f50
hi DiffChange   guibg=#425c78 guifg=#7fbdff
hi DiffText     guibg=#4e9a06 guifg=#8ae234
hi SpellBad     gui=undercurl guisp=#f02020


hi Title          guibg=#f3f2ed guifg=#202020 gui=underline
hi Normal         guibg=#f3f2ed guifg=#404040 gui=none

hi Comment        guibg=#f3f2ed guifg=#bbbbbb gui=none

hi Constant       guibg=#f3f2ed guifg=#957301 gui=none
hi String         guibg=#f3f2ed guifg=#a07060 gui=none
hi Character      guibg=#f3f2ed guifg=#bb6245 gui=none
hi Number         guibg=#f3f2ed guifg=#ba7222 gui=none
hi Boolean        guibg=#f3f2ed guifg=#d4552c gui=none
hi Float          guibg=#f3f2ed guifg=#e87a00 gui=none

hi Identifier     guibg=#f3f2ed guifg=#546c48 gui=none
hi Function       guibg=#f3f2ed guifg=#6d7181 gui=none

hi Statement      guibg=#f3f2ed guifg=#606060 gui=none
hi Conditional    guibg=#f3f2ed guifg=#81ac3a gui=none
hi Repeat         guibg=#f3f2ed guifg=#aab844 gui=none
hi Label          guibg=#f3f2ed guifg=#969664 gui=underline
hi Operator       guibg=#f3f2ed guifg=#a79a39 gui=none
hi Keyword        guibg=#f3f2ed guifg=#408077 gui=none
hi Exception      guibg=#f3f2ed guifg=#a03020 gui=none

hi PreProc        guibg=#f3f2ed guifg=#7d64af gui=none
hi Include        guibg=#f3f2ed guifg=#c5a2d8 gui=none
hi Define         guibg=#f3f2ed guifg=#605080 gui=none
hi Macro          guibg=#f3f2ed guifg=#79519d gui=none
hi PreCondit      guibg=#f3f2ed guifg=#75698c gui=none

hi Type           guibg=#f3f2ed guifg=#7d95ad gui=none
hi StorageClass   guibg=#f3f2ed guifg=#678b5b gui=none
hi Structure      guibg=#f3f2ed guifg=#5d6da3 gui=none
hi Typedef        guibg=#f3f2ed guifg=#5080b0 gui=none

hi Special        guibg=#f3f2ed guifg=#408077 gui=none
hi SpecialChar    guibg=#f3f2ed guifg=#603020 gui=none
hi Tag            guibg=#f3f2ed guifg=#a6a679 gui=underline
hi Delimiter      guibg=#f3f2ed guifg=#808080 gui=none
hi SpecialComment guibg=#f3f2ed guifg=#caacac gui=none
hi Debug          guibg=#f3f2ed guifg=#908080 gui=none

hi Underlined     guibg=#f3f2ed guifg=#202020 gui=underline

hi Error          guibg=#faf5cd guifg=#c83c28 gui=none

hi ToDo           guibg=#f3f2ed guifg=#404040 gui=none


