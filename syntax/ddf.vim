" ASML DDF files syntax highlighting
" ddf.vim: Vim syntax file for DDF.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Match case
syn case match

" keywords
syn keyword ddfInterface         contained interface
syn keyword ddfFunction          contained function trigger event

" special keywords inside interface
syn keyword ddfInterfaceType     contained defaulttimeout fullconst library runtimeaccess server
syn keyword ddfInterfaceType     contained simulation singleton tracing fcn nonblocking
syn keyword ddfInterfaceType     contained throughput notrace
syn keyword ddfInterfaceType     enum2str enum2desc

" special ASML values
syn keyword ddfValue             TRUE FALSE OK

" todo flags
syn keyword ddfTodo              contained TODO FIXME XXX BUG

" function specifiers
syn keyword ddfFuncParam         contained in out return inout nextgroup=ddfCompName,ddfType skipwhite

" attribute identifiers
syn keyword ddfSetParam          contained desc format significance unit scale default min max
syn keyword ddfSetParam          contained edit_privilege microhelp scaled_unit to_default exists_flag

" matcher for comp name
syn match ddfCompName            contained '[A-Z][A-Zx_]*:[A-Za-z0-9_]\+\s'

" matcher for numbers
syn match   ddfNumber            "\<-\=\(0\|[1-9]_\?\(\d\|\d\+_\?\d\+\)*\)\%([Ee][-+]\=\d\+\)\=\>"
syn match   ddfNumber            "\<-\=0[xX]_\?\(\x\+_\?\)\+\>"

" For default types
syn keyword ddfType              bool char short int float double string varstring
syn keyword ddfType              array timestamp instanceid virtual struct union enum
syn keyword ddfType              typedef const horvervect xyvect xyzvect set zrxryvect
syn keyword ddfType              attributedef

" regions
" comment region
syn region ddfComment            start="#" end="$" contains=ddfTodo,@Spell
" interface region
syn region innerInterface        start="interface\s\+[A-Zx]*\s*\n*\s*{" end="}" transparent contains=ddfInterfaceType,ddfComment,ddfInterface,ddfFunction,innerInterfaceFunc,ddfType,ddfFuncParam,ddfString,ddfNumber
" set region
syn region innerSet              start="set\n*{" end="}" transparent contains=ddfSetParams, ddfComment
" set attributes region
syn region ddfSetParams          start=+<+ end=+>+ transparent contains=ddfNumber,ddfSetParam,ddfString
" region for strings
syn region ddfString             start=+"+ skip=+\\\\\|\\"+ end=+"+

" highlighting
hi def link ddfType              Keyword
hi def link ddfInterfaceType     Label
hi def link ddfComment           Comment
hi def link ddfFunction          Function
hi def link ddfInterface         Function
hi def link ddfFuncParam         Identifier
hi def link ddfTodo              Todo
hi def link ddfCompName          Keyword
hi def link ddfNumber            Float
hi def link ddfValue             Float
hi def link ddfSetParam          Label
hi def link ddfString            String

