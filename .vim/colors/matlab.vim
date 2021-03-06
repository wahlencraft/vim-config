if !has("gui_running")
    set termguicolors
endif

set background=light

hi clear

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name = "matlab"


"hi Normal guifg=#000000 guibg=#ffffff
hi Normal guifg=#000000 guibg=#fcfcdc

hi Visual guifg=#335ea8 guibg=#ffffff
hi Visual guibg=#ffffff guifg=#335ea8

hi OverLength guibg=#ffffff
"
hi Search guibg=#ffffff guifg=#335ea8
"hi MatchParen guifg=#ff0000 guibg=#0000ff
"
hi LineNr guifg=#000000 guibg=#ebe9ed
hi SignColumn guibg=#ebe9ed
hi GitGutterAdd    guifg=#009900 guibg=#ebe9ed
hi GitGutterChange guifg=#bbbb00 guibg=#ebe9ed
hi GitGutterChange guifg=#777700 guibg=#ebe9ed
hi GitGutterDelete guifg=#ff2222 guibg=#ebe9ed
"hi Title guifg=#ff0000 guibg=#0000ff
hi Underlined guifg=#ff0000 guibg=#0000ff


hi StatusLine guifg=#004073 guibg=#ffffff
hi StatusLineNC guifg=#004073 guibg=#ffffff
"hi VertSplit guifg=#004073
hi VertSplit guifg=#ebe9ed guibg=#000000

hi Folded guifg=#ff0000 guibg=#0000ff
hi FoldColumn guifg=#ff0000 guibg=#0000ff

hi Statement guifg=#0e00ff
hi Exception guifg=#ff0000 guibg=#0000ff
"
hi Type guifg=#ff0000 guibg=#0000ff
hi StorageClass guifg=#ff0000 guibg=#0000ff
"
hi Identifier guifg=#000000
hi Function guifg=#000000
"
hi Number guifg=#000000
hi Boolean guifg=#ff0000 guibg=#0000ff
hi Constant guifg=#444444 gui=bold cterm=bold
"
hi String guifg=#aa04f9
hi SpecialChar guifg=#000000
hi Character guifg=#ff0000 guibg=#0000ff
hi WarningMsg guifg=#ff0000 guibg=#0000ff
"
hi Delimiter guifg=#000000
hi Operator guifg=#000000
"
hi Special guifg=#ff0000 guibg=#0000ff
hi SpecialKey guifg=#ebe9ed
hi NonText guifg=#ebe9ed

hi Comment guifg=#028009
hi matlabHeaderComment guifg=#028009 gui=bold cterm=bold
hi SpecialComment guifg=#ff0000 guibg=#0000ff
hi Todo guifg=#fcfcdc guibg=#028009


hi PreProc guifg=#ff0000 guibg=#0000ff

hi Tag guifg=#ff0000 guibg=#0000ff
hi Debug guifg=#ff0000 guibg=#0000ff

hi Error guifg=#ff0000 guibg=#0000ff
