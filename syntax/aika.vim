if exists("b:current_syntax")
  finish
endif

syn match aikaStatement /\<\%(return\|break\)\>/ display
hi def link aikaStatement Statement

syn match aikaRepeat /\<\%(for\|while\)\>/ display
hi def link aikaRepeat Repeat

syn match aikaConditional /\<\%(if\|else\|elseif\|then\|switch\|when\)\>/ display
hi def link aikaConditional Conditional

syn match aikaKeyword /\<\%(with\|in\|and\|or\|not\|end\|class\|extends\|super\|do\)\>/ display
hi def link aikaKeyword Keyword

syn keyword aikaLuaFunc assert collectgarbage dofile error next
syn keyword aikaLuaFunc print rawget rawset tonumber tostring type _VERSION
syn keyword aikaLuaFunc _G getfenv getmetatable ipairs loadfile
syn keyword aikaLuaFunc loadstring pairs pcall rawequal
syn keyword aikaLuaFunc require setfenv setmetatable unpack xpcall
syn keyword aikaLuaFunc load module select
hi def link aikaLuaFunc Identifier

syn match aikaExtendedOp /\%(\S\s*\)\@<=[+\-*/%&|\^=!<>?#]\+\|\.\|\\/ display
hi def link aikaExtendedOp aikaOperator
hi def link aikaOperator Operator

syntax match aikaFunction /fn\|)\|(\|\[\|]\|{\|}\|!/
highlight default link aikaFunction Function

syn match aikaSpecialOp /[,;]/ display
hi def link aikaSpecialOp SpecialChar

syn match aikaBoolean /\<\%(true\|false\)\>/ display
hi def link aikaBoolean Boolean

syn match aikaSpecialVar /\<\%(self\)\>/ display
syn match aikaSpecialVar /@\%(\I\i*\)\?/ display
syn match aikaSpecialVar /$\%(\I\i*\)\?/ display
hi def link aikaSpecialVar Structure

syn match aikaObject /\<\u\w*\>/ display
hi def link aikaObject Type
syn match aikaConstant /\<\u[A-Z0-9_]\+\>/ display
hi def link aikaConstant Constant

syn cluster aikaIdentifier contains=aikaSpecialVar,aikaObject,aikaConstant

syn cluster aikaBasicString contains=@Spell,aikaEscape
syn cluster aikaInterpString contains=@aikaBasicString,aikaInterp

syn region aikaString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=@aikaInterpString
syn region aikaString start=/'/ skip=/\\\\\|\\'/ end=/'/ contains=@aikaBasicString
hi def link aikaString String
syn region aikaString2 matchgroup=aikaString start="\[\z(=*\)\[" end="\]\z1\]" contains=@Spell
hi def link aikaString2 String

syn match aikaNumber /\i\@<![-+]\?\d\+\%([eE][+-]\?\d\+\)\?/ display
syn match aikaNumber /\<0[xX]\x\+\>/ display
hi def link aikaNumber Number
syn match aikaFloat /\i\@<![-+]\?\d*\.\@<!\.\d\+\%([eE][+-]\?\d\+\)\?/ display
hi def link aikaFloat Float

syn match aikaComment "\%^#!.*"
syn match aikaComment /--.*/ contains=@Spell
syn region aikaCommentLong matchgroup=aikaComment start="--\[\z(=*\)\[" end="\]\z1\]" contains=@Spell
hi def link aikaComment Comment
hi def link aikaCommentLong aikaComment

syn region aikaInterp matchgroup=aikaInterpDelim start=/#{/ end=/}/ contained contains=@aikaAll
hi def link aikaInterpDelim PreProc

syn match aikaEscape /\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\./ contained display
hi def link aikaEscape SpecialChar

syn region aikaCurlies matchgroup=aikaCurly start=/{/ end=/}/ contains=@aikaAll contained

syn cluster aikaAll contains=aikaStatement,aikaRepeat,aikaConditional,aikaKeyword,aikaOperator,aikaFunction,aikaExtendedOp,aikaSpecialOp,aikaBoolean,aikaSpecialVar,aikaObject,aikaConstant,aikaString,aikaNumber,
\                            aikaFloat,aikaComment,aikaLuaFunc,aikaCurlies

let b:current_syntax = "aika"
