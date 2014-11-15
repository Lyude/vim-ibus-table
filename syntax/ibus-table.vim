" Vim syntax file
" Language:	ibus-table template
" Maintainer:	Lyude <thatslyude@gmail.com>
" Last Change:	2014 August 31

syn match ibusTableComment "###.*$" containedin=ALL

syn match ibusTableHeaderVariable /^SCIM_Generic_Table_Phrase_Library_TEXT$/ containedin=TOP
syn match ibusTableHeaderVariable /^VERSION_[0-9_]\+$/ containedin=TOP

" DEFINITION matching
syn region ibusTableDefinition start="BEGIN_DEFINITION" end="END_DEFINITION" contains=ibusTableVariable,ibusTableLocaleName,ibusTableDefinitionDelimiter keepend

syn match ibusTableVariable /^\(LICENSE\|UUID\|SERIAL_NUMBER\|ICON\|NAME\|DESCRIPTION\|LANGUAGES\|AUTHOR\|STATUS_PROMPT\|VALID_INPUT_CHARS\|LAYOUT\|MAX_KEY_LENGTH\|AUTO_COMMIT\|DEF_FULL_WIDTH_PUNCT\|DEF_FULL_WIDTH_LETTER\|USER_CAN_DEFINE_PHRASE\|PINYIN_MODE\|DYNAMIC_ADJUST\|NO_CHECK_CHARS\|RULES\|PAGE_UP_KEYS\|PAGE_DOWN_KEYS\)/ contained nextgroup=ibusTableSetVariable skipwhite
syn match ibusTableLocaleName /^NAME\.[^ ]\+/ nextgroup=ibusTableSetVariable skipwhite
syn match ibusTableSetVariable "=" skipwhite contained nextgroup=ibusTableBoolean,ibusTableString
syn match ibusTableString ".*$" contained
syn keyword ibusTableBoolean contained TRUE FALSE

syn match ibusTableDefinitionDelimiter "BEGIN_DEFINITION\|END_DEFINITION" contained

" DATA matching
syn region ibusTableData start="BEGIN_TABLE" end="END_TABLE" contains=ibusTableInputKeys,ibusTableDataDelimiter keepend

syn match ibusTableInputKeys "[^\t]\+" contained skipwhite nextgroup=ibusTableAimChars
syn match ibusTableAimChars "[^\t]\+" contained skipwhite nextgroup=ibusTableFreq
syn match ibusTableFreq /[0-9]\{-}/ contained skipwhite nextgroup=ibusTableInvalidFreq
syn match ibusTableInvalidFreq /[^0-9]*/ skipwhite contained
syn match ibusTableDataDelimiter "BEGIN_TABLE\|END_TABLE" contained

" GOUCI matching
syn region ibusTableData start="BEGIN_GOUCI" end="END_GOUCI" contains=ibusTableGouciCharacter,ibusTableGouciDelimiter keepend

syn match ibusTableGouciCharacter "^[^\t]\+" contained skipwhite nextgroup=ibusTableGoucima
syn match ibusTableGoucima "[^\t]\+" contained skipwhite

syn match ibusTableGouciDelimiter "BEGIN_GOUCI\|END_GOUCI" contained

hi def link ibusTableDefinitionDelimiter Statement
hi def link ibusTableDataDelimiter       Statement
hi def link ibusTableGouciDelimiter      Statement
hi def link ibusTableHeaderVariable      PreProc
hi def link ibusTableComment             Comment
hi def link ibusTableVariable            Identifier
hi def link ibusTableLocaleName          Identifier
hi def link ibusTableSetVariable         Operator
hi def link ibusTableBoolean             Boolean
hi def link ibusTableString              String
hi def link ibusTableInputKeys           String
hi def link ibusTableAimChars            String
hi def link ibusTableFreq                Number
hi def link ibusTableInvalidFreq         Error
hi def link ibusTableGouciCharacter      String
hi def link ibusTableGoucima             String

syntax sync fromstart

let b:current_syntax = "ibus-table"
