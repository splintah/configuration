set bg&
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "splintah"

" SYNTAX HIGHLIGHT GROUPS
"
" *Comment    any comment
"
" *Constant   any constant
"  String     a string constant: "this is a string"
"  Character  a character constant: 'c', '\n'
"  Number     a number constant: 234, 0xff
"  Boolean    a boolean constant: TRUE, false
"  Float      a floating point constant: 2.3e10
"
" *Identifier any variable name
"  Function   function name (also: methods for classes)
"
" *Statement        any statement
"  Conditional      if, then, else, endif, switch, etc.
"  Repeat           for, do, while, etc.
"  Label            case, default, etc.
"  Operator         'sizeof', '+', '*', etc.
"  Keyword          any other keyword
"  Exception        try, catch, throw
"
" *PreProc      generic Preprocessor
"  Include      preprocessor #include
"  Define       preprocessor #define
"  Macro        same as Define
"  PreCondit    preprocessor #if, #else, #endif, etc.
"
" *Type             int, long, char, etc.
"  StorageClass     static, register, volatile, etc.
"  Structure        struct, union, enum, etc.
"  Typedef          A typedef
"
" *Special          any special symbol
"  SpecialChar      special character in a constant
"  Tag              you can use CTRL-] on this
"  Delimiter        character that needs attention
"  SpecialComment   special things inside a comment
"  Debug            debugging statements
"
" *Underlined       text that stands out, HTML links
"
" *Ignore           left blank, hidden |hl-Ignore|
"
" *Error            any erroneous construct
"
" *Todo             anything that needs extra attention;
"                   mostly the keywords TODO FIXME and XXX

hi Pmenu ctermfg=7 ctermbg=Black guifg=White guibg=Black

hi Normal guifg=7 guibg=Black
hi Comment ctermfg=DarkGray guifg=DarkGray

hi Identifier ctermfg=Yellow guifg=#4f4f4f
hi cCustomFunc ctermfg=8 guifg=#4f4f4f

hi Statement ctermfg=Yellow guifg=#4f4f4f
hi Operator ctermfg=Yellow guifg=Green

hi Type ctermfg=7 guifg=Green
hi StorageClass ctermfg=Yellow guifg=#4f4f4f
hi Structure ctermfg=Yellow guifg=Green

hi Constant ctermfg=Yellow guifg=DarkGCyan
hi String ctermfg=DarkGray guifg=DarkGray
hi Character ctermfg=DarkGray guifg=DarkGray
hi Number ctermfg=Yellow guifg=DarkCyan
hi Boolean ctermfg=Yellow guifg=Green

hi Special ctermfg=DarkGray guifg=DarkGray

hi SignColumn ctermbg=Black guibg=Black
hi lineNr ctermfg=DarkGray guifg=DarkGray

hi Todo ctermfg=Red guifg=Red ctermbg=NONE guibg=NONE cterm=bold gui=bold,underline
hi myNote ctermfg=DarkGray ctermbg=NONE cterm=bold
hi myStatic ctermfg=Yellow

hi Error ctermfg=Black ctermbg=DarkRed guifg=Black guibg=DarkRed

hi TabLine ctermbg=Black ctermfg=8 guibg=Black guifg=8
hi TabLineSel ctermfg=DarkRed guifg=DarkRed
hi TabLineFill ctermfg=Black guifg=Black
hi VertSplit ctermbg=Black ctermfg=Black guifg=Black guibg=Green

hi Search cterm=bold ctermfg=Black ctermbg=DarkRed guifg=Black gui=bold guibg=DarkRed
hi Visual ctermfg=Black ctermbg=DarkRed cterm=NONE

hi PreProc ctermfg=Magenta guifg=Green
hi MatchParen cterm=bold ctermbg=NONE ctermfg=DarkGreen

hi StatusLine ctermfg=Black ctermbg=8 guifg=Black guibg=8
hi StatusLineNC ctermfg=Black ctermbg=8 guifg=Black guibg=8
hi CursorLine cterm=NONE ctermbg=Black gui=NONE guibg=Black
hi StatusLine ctermbg=NONE cterm=NONE

