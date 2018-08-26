if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax case ignore

" TODO

let b:current_syntax = "kql"
