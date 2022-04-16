"==============================================================================
" Color dictionary
"==============================================================================
let s:clr = {}

let s:clr.dark_red = ["#c80000", "DarkRed"]
let s:clr.red = ["#d95520", "Red"]
let s:clr.orange = ["#ffaa00", "DarkYellow"]
let s:clr.dark_yellow = ["#d3ab46", "DarkYellow"]
let s:clr.yellow = ["#fce94f", "Yellow"]

let s:clr.light_blue = ["#5fd7ff", "LightBlue"]
let s:clr.cyan = ["#34e2e2", "Cyan"]
let s:clr.light_green = ["#85fbac", "LightGreen"]
let s:clr.light_green2 = ["#63c98a", "LightGreen"]
let s:clr.bright_green = ["#8ae234", "Green"]
let s:clr.magenta = ["#9f759a", "Magenta"]
let s:clr.dark_magenta = ["#75507b", "DarkMagenta"]

let s:clr.bright_white = ["#ffffff", "White"]
let s:clr.white = ["#d3d7cf", "White"]
let s:clr.gray = ["#a8a8a8", "Gray"]
let s:clr.dark_gray = ["#6c6c6c", "DarkGray"]
let s:clr.black = ["#333333", "Black"]
let s:clr.pitch_black = ["#000000", "Black"]

let s:clr.soft_red = ["#d27577", "DarkRed"]
let s:clr.soft_orange = ["#c99d6c", "DarkYellow"]
let s:clr.soft_yellow = ["#ceb47b", "Yellow"]
let s:clr.soft_green = ["#a1c17e", "Green"]
let s:clr.soft_cyan = ["#6eb3c1", "Cyan"]
let s:clr.blue = ["#73adeb", "Blue"]
let s:clr.purple = ["#bb7ed9", "Magenta"]
let s:clr.wet_gray = ["#5d636f", "DarkGray"]

let s:clr.vibrant_gray = ["#767676", "DarkGray"]
let s:clr.vibrant_yellow = ["#fffd00", "Yellow"]
let s:clr.vibrant_purple = ["#cc56ec", "Magenta"]
let s:clr.vibrant_dark_purple = ["#9923b9", "Magenta"]

" Soft dark background colors
let s:clr.sdb_green = ["#113311", "DarkGreen"]
let s:clr.sdb_red = ["#553333", "DarkRed"]
let s:clr.sdb_yellow = ["#333311", "DarkYellow"]
let s:clr.sdb_orange = ["#554411", "DarkYellow"]

" gruvbox colors
let s:clr.gruvbox_dark_red = ["#cc241d", "DarkRed"]
let s:clr.gruvbox_red = ["#fb4934", "Red"]
let s:clr.gruvbox_dark_yellow = ["#d79921", "DarkYellow"]
let s:clr.gruvbox_yellow = ["#fabd2f", "Yellow"]
let s:clr.gruvbox_clay_green = ["#b8bb26", "Green"]
let s:clr.gruvbox_green = ["#98971a", "DarkGreen"]
let s:clr.gruvbox_metalic_green = ["#8ec07c", "LightGreen"]
let s:clr.gruvbox_cyan = ["#689d6a", "Cyan"]
let s:clr.gruvbox_blue = ["#83a598", "Cyan"]
let s:clr.gruvbox_dark_blue = ["#458588", "DarkBlue"]
let s:clr.gruvbox_pink = ["#d3869b", "LightMagenta"]
let s:clr.gruvbox_magenta = ["#b16286", "Magenta"]

let s:clr.gruvbox_white = ["#ebdbb2", "White"]
let s:clr.gruvbox_brown = ["#a89984", "Brown"]
let s:clr.gruvbox_gray = ["#928374", "Gray"]
let s:clr.gruvbox_dark_gray = ["#282828", "DarkGray"]
let s:clr.gruvbox_black = ["#1d2021", "Black"]

let s:clr.none = ['NONE', 'NONE']
let s:bold = 'bold'
let s:italic = 'italic'

function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    " foreground
    let fg = a:fg

    " background
    if a:0 >= 1
        let bg = a:1
    else
        let bg = s:clr.none
    endif

    " emphasis
    if a:0 >= 2 && strlen(a:2)
        let emstr = a:2
    else
        let emstr = 'NONE,'
    endif

    let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-1], 'cterm=' . emstr[:-1]
        \ ]

    " special
    if a:0 >= 3
        call add(histring, 'guisp=' . a:3[0])
    endif

    execute join(histring, ' ')
endfunction

function! s:HLBack(group, bg, ...)
    " Arguments: group, guibg, gui, guisp

    " background
    let bg = a:bg

    " emphasis
    if a:0 >= 1 && strlen(a:2)
        let emstr = a:2
    else
        let emstr = 'NONE,'
    endif

    let histring = [ 'hi', a:group,
        \ 'guifg=NONE', 'ctermfg=NONE',
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-1], 'cterm=' . emstr[:-1]
        \ ]

    " special
    if a:0 >= 3
        call add(histring, 'guisp=' . a:3[0])
    endif

    execute join(histring, ' ')
endfunction

function! s:HLBold(group, fg)
    call s:HL(a:group, a:fg, s:clr.none, s:bold)
endfunction

" Some colors that might be good
" red #E06C75
" dark_red #BE5046
" green #98C379
" yellow #E5C07B
" dark_yellow #D19A66
" blue #61AFEF
" pink #e2637f
" purple #C678DD
" cyan #56B6C2
" white #ABB2BF
" black #282C34
" foreground #ABB2BF
" background #282C34
" comment_grey #5C6370
" gutter_fg_grey #4B5263
" cursor_grey #2C323C
" visual_grey #3E4452
" menu_grey #3E4452
" special_grey #3B4048
" vertsplit #3E4452

" Use gui colors in terminal: set termguicolors
" https://gist.github.com/Trollwut/842b21318e82f8bf5ca97df80ba57069

" black         #000000
" red 	        #cc0000
" green         #4e9a06
" yellow        #c4a000
" blue*         #729fcf
" magenta 	    #75507b
" cyan 	        #06989a
" white         #d3d7cf
" bright black 	#555753
" bright red    #ef2929
" bright green 	#8ae234
" bright yellow #fce94f
" bright blue* 	#32afff
" bright magenta#ad7fa8
" bright cyan 	#34e2e2

" cterm colors
" LightGreen    #85fbac
" Cyan          #34e2e2
" Some green    #73c48f
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "custom"


" Use gui colors if loaded with supported color. Otherwise fall back to cterm
autocmd FileType sh,cpp,c,arm,python,lua setlocal termguicolors

"==============================================================================
" Internal Terminal
"==============================================================================

" In GUI or with termguicolors use thease 16 colors as the color palette
" fot the :terminal window.
let g:terminal_ansi_colors = [
                \ "#373c40", "#ff5454", "#8cc85f", "#e3c78a",
                \ "#80a0ff", "#ce76e8", "#7ee0ce", "#de935f",
                \ "#f09479", "#f74782", "#42cf89", "#cfcfb0",
                \ "#78c2ff", "#ae81ff", "#85dc85", "#d3d7cf"
                \]
" And specify background color
hi Terminal guibg=#151515

"==============================================================================
" Debug
"==============================================================================
if exists("g:colorschemedebug")
    " Set dark gray default, making it easy to spot not yet colored groups
    call s:HL('Comment', s:clr.dark_gray)
    call s:HL('Constant', s:clr.dark_gray)
    call s:HL('Special', s:clr.dark_gray)
    call s:HL('Identifier', s:clr.dark_gray)
    call s:HL('Statement', s:clr.dark_gray)
    call s:HL('PreProc', s:clr.dark_gray)
    call s:HL('Type', s:clr.dark_gray)
    call s:HL('Function', s:clr.dark_gray)
    call s:HL('Repeat', s:clr.dark_gray)
    call s:HL('Operator', s:clr.dark_gray)
    call s:HL('Ignore', s:clr.dark_gray)
    call s:HL('Error', s:clr.dark_gray)
    call s:HL('Todo', s:clr.dark_gray)
    call s:HL('String', s:clr.dark_gray)
    call s:HL('Character', s:clr.dark_gray)
    call s:HL('Number', s:clr.dark_gray)
    call s:HL('Boolean', s:clr.dark_gray)
    call s:HL('Float', s:clr.dark_gray)
    call s:HL('Conditional', s:clr.dark_gray)
    call s:HL('Label', s:clr.dark_gray)
    call s:HL('Keyword', s:clr.dark_gray)
    call s:HL('Exception', s:clr.dark_gray)
    call s:HL('Include', s:clr.dark_gray)
    call s:HL('Define', s:clr.dark_gray)
    call s:HL('Macro', s:clr.dark_gray)
    call s:HL('PreCondit', s:clr.dark_gray)
    call s:HL('StorageClass', s:clr.dark_gray)
    call s:HL('Structure', s:clr.dark_gray)
    call s:HL('Typedef', s:clr.dark_gray)
    call s:HL('Tag', s:clr.dark_gray)
    call s:HL('SpecialChar', s:clr.dark_gray)
    call s:HL('Delimiter', s:clr.dark_gray)
    call s:HL('SpecialComment', s:clr.dark_gray)
    call s:HL('Debug', s:clr.dark_gray)
endif

" Reload this file, but toggle the debug higlighting
if !exists("s:functiondefguard")
    let s:functiondefguard = 1
    function ToggleColorSchemeTest()
        if exists("g:colorschemedebug")
            unlet g:colorschemedebug
            let status = "OFF"
        else
            let g:colorschemedebug = 1
            let status = "ON"
        endif
        colorscheme custom
        redraw
        echo "Colorschme debug:" status
    endfunction
endif

" Keycombo to find highlight group for word under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
map gm :call SynStack()<CR>

"==============================================================================
" Global settings
"==============================================================================
hi Normal       ctermfg=white       guifg=#d3d7cf
hi LineNr       ctermfg=Gray        guifg=#444444
hi Search                           guibg=#d3ab46
hi OverLength   ctermfg=red         guibg=#592929
hi NonText      ctermfg=DarkGray    guifg=#444444
hi SpecialKey   ctermfg=DarkGrey    guifg=#444444
hi! link SignColumn     background
hi GitGutterAdd    guifg=#226622
hi GitGutterChange guifg=#999900
hi GitGutterDelete guifg=#662222

"==============================================================================
" Vim
"==============================================================================
call s:HL('vimGroup', s:clr.light_green)
call s:HL('vimCommand', s:clr.dark_yellow)
call s:HL('vimLineComment', s:clr.dark_gray)
call s:HL('vimAttrimb', s:clr.light_blue)
call s:HL('vimString', s:clr.dark_yellow, s:clr.none, s:italic)
call s:HL('vimParenSep', s:clr.white)
call s:HL('vimVar', s:clr.cyan, s:clr.none, s:bold)
call s:HL('vimNotation', s:clr.dark_magenta)
call s:HL('vimNumber', s:clr.bright_green)
call s:HL('vimOper', s:clr.white)
call s:HL('vimTodo', s:clr.black, s:clr.dark_yellow)

"==============================================================================
" Vimdiff
"==============================================================================
call s:HLBack('DiffAdd', s:clr.sdb_green)     " Added line
call s:HLBack('DiffChange', s:clr.sdb_yellow) " Changed line
call s:HL('DiffDelete', s:clr.black, s:clr.sdb_red)    " Deleted line
call s:HL('DiffRemoved', s:clr.sdb_red)    " Patch diff removed
call s:HLBack('DiffText', s:clr.sdb_orange)   " Changed text within a changed line
"==============================================================================
" C
"==============================================================================
let c_gnu = 1

call s:HL('cType', s:clr.light_green)
call s:HL('cComment', s:clr.dark_gray)
call s:HL('cRepeat', s:clr.white, s:clr.none, s:bold)
call s:HL('cConstant', s:clr.magenta)
call s:HL('cSpecial', s:clr.dark_magenta)
call s:HL('cStatement', s:clr.dark_yellow)
call s:HL('cCustomFunc', s:clr.light_blue)
call s:HL('cCustomScope', s:clr.orange)
call s:HL('cPreProc', s:clr.light_blue)
call s:HL('cppContainer', s:clr.light_green2)
call s:HL('cMember', s:clr.orange)
call s:HL('cTodo', s:clr.black, s:clr.dark_yellow)

hi link cTypeDef        cType
hi link cStructure      cType
hi link cStorageClass   cType
hi link cString	        cConstant
hi link cCharacter      cConstant
hi link cNumber	        cConstant
hi link cFloat          cNumber
hi link cBoolean        cConstant
hi link cLabel          cStatement
hi link cKeyword        cStatement
hi link cException      cStatement
hi link cConditional    cRepeat
hi link cCustomClass    Normal
hi link cInclude        cPreProc
hi link cDefine	        cPreProc
hi link cPreCondit      cPreProc

"==============================================================================
" C++
"==============================================================================

" class typename template namespace
call s:HL('cppStructure', s:clr.orange, s:clr.none, s:bold)
" public protected private
call s:HL('cppAccess', s:clr.orange)
" new delete this friend using
call s:HL('cppStatement', s:clr.dark_gray, s:clr.none, s:bold)

hi link cppModifier	    cType
hi link cppType	        cType
hi link cppNumber       cNumber
hi link cppExceptions   cException
hi link cppBoolean      cConstant
hi link cppConstant	    cConstant
hi link cppOperator     cCustomFunc

" TODO?
" cppOperator: and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
" cppCast: "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
" cppCast: "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
" cppStorageClass: mutable constexpr decltype thread_local
" cppRawString:	matchgroup=cppRawStringDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell

"==============================================================================
" ARM Assembly
"==============================================================================
call s:HL('gasDirective', s:clr.dark_yellow)
call s:HL('armv6Instructions', s:clr.light_green)
call s:HL('armRegister', s:clr.gray)
call s:HL('armNumericOp', s:clr.white)

hi link armComment         cComment
hi link armOperator        cOperator
hi link armNumber          cNumber
hi link armString          cString
hi link armIdentifier      Normal
hi link armLabel           cCustomFunc
hi link armDirective       gasDirective
hi link armCPreProc        cPreProc
hi link armTodo            cTodo

"==============================================================================
" SH
"==============================================================================

" hi link shArithmetic
" shCharClass		Identifier
" ';;', ')' in case ↓
call s:HL('shSnglCase', s:clr.white)
" Command options ↓
call s:HL('shFunction', s:clr.white)
call s:HL('shCommandSub', s:clr.white)
call s:HL('shComment', s:clr.gray)
call s:HL('shConditional', s:clr.white)
" shCtrlSeq		Special
" shExprRegion		Delimiter
"hi link shFunctionKey   Normal
"hi link shFunctionName  Normal
call s:HL('shNumber', s:clr.dark_magenta)
" Variables and stuff ↓
call s:HL('shSetList', s:clr.soft_red, s:clr.none, s:bold)
call s:HL('shShellVariables', s:clr.soft_red)
call s:HL('shSpecial', s:clr.black)
" shSpecialDQ		Special
" shSpecialSQ		Special
" shSpecialNoZS		shSpecial
call s:HL('shStatement', s:clr.orange)
call s:HL('shString', s:clr.vibrant_gray)

hi link shTodo cTodo
hi link shAlias      shSetList
hi link shSet           shStatement
hi link shOperator      Normal
hi link shQuote         shString
"hi link shExpr          shShellVariable
" shHereDoc01		shRedir
" shHereDoc02		shRedir
" shHereDoc03		shRedir
" shHereDoc04		shRedir
" shHereDoc05		shRedir
" shHereDoc06		shRedir
" shHereDoc07		shRedir
" shHereDoc08		shRedir
" shHereDoc09		shRedir
" shHereDoc10		shRedir
" shHereDoc11		shRedir
" shHereDoc12		shRedir
" shHereDoc13		shRedir
" shHereDoc14		shRedir
" shHereDoc15		shRedir
" shHereDoc16		shRedir

"==============================================================================
" Python
"==============================================================================
" Stolen from the atom colorsheme

let python_highlight_all = 1

"hi Normal guifg=#acb2be guibg=#292c34
"hi LineNr guifg=#4c5363
" It's impossible to change theese↑ on a language-specific basis
call s:HL('pythonComment', s:clr.wet_gray, s:clr.none, s:italic)
call s:HL('pythonStatement', s:clr.purple)
call s:HL('pythonString', s:clr.soft_green)
call s:HL('pythonClass', s:clr.soft_yellow)
call s:HL('pythonNumber', s:clr.soft_orange)
call s:HL('pythonFunction', s:clr.blue)
call s:HL('pythonBuiltinFunc', s:clr.soft_cyan)
call s:HL('pythonTodo', s:clr.black, s:clr.yellow)
call s:HL('pythonAttribute', s:clr.soft_red)

hi link pythonRun pythonComment
hi link pythonFString pythonString
hi link pythonImport pythonStatement
hi link pythonRepeat pythonStatement
hi link pythonConditional pythonStatement
hi link pythonOperator pythonStatement
hi link pythonException pythonStatement
hi link pythonFunctionCall pythonFunction
hi link pythonDecorator pythonFunction
hi link pythonDottedName pythonFunction
hi link pythonBoolean pythonNumber
hi link pythonNone pythonNumber
hi link pythonClassVar Normal
hi link pythonExClass pythonBuiltinFunc
hi link pythonBuiltinObj Normal
hi link pythonBuiltinType pythonBuiltinFunc

"==============================================================================
" Lua
"==============================================================================

call s:HL('luaComment', s:clr.vibrant_gray)
call s:HL('luaStatement', s:clr.vibrant_yellow)
call s:HL('luaString', s:clr.vibrant_purple)
call s:HL('luaTable', s:clr.light_green)
call s:HL('luaRepeat', s:clr.white, s:clr.none, s:bold)
call s:HL('luaFunc', s:clr.cyan, s:clr.none, s:bold)
call s:HL('luaSpecial', s:clr.vibrant_dark_purple)
call s:HL('luaNumber', s:clr.cyan)

hi link luaConstant luaString
hi link luaFunction luaStatement
hi link luaIn luaRepeat
hi link luaOperator Normal

hi link luaCond luaRepeat

"==============================================================================
" Tex
"==============================================================================

call s:HLBold('texCmdName', s:clr.gruvbox_yellow)
hi link texDefCmd texCmdName
hi link texDefName texCmdName
hi link texStatement texCmdName
hi link texNewCmd texCmdName

call s:HLBold('texDelimiter', s:clr.gruvbox_red) "?
call s:HLBold('texInputFile', s:clr.gruvbox_red)
call s:HLBold('texComment', s:clr.gruvbox_metalic_green)
call s:HLBold('texSectionZone', s:clr.gruvbox_white)
call s:HLBold('texSubSectionZone', s:clr.gruvbox_white)
call s:HLBold('texMatcherNM', s:clr.gruvbox_white)
call s:HLBold('texSubSubSectionZone', s:clr.gruvbox_white)
call s:HLBold('texLength', s:clr.gruvbox_magenta)
call s:HLBold('texSection', s:clr.gruvbox_blue)
call s:HLBold('texCmdArgs', s:clr.gruvbox_pink)
call s:HLBold('texTypeStyle', s:clr.gruvbox_clay_green)
call s:HLBold('texMath', s:clr.gruvbox_blue)
call s:HLBold('texMathMatcher', s:clr.gruvbox_red)
call s:HLBold('texMathOper', s:clr.gruvbox_white)

