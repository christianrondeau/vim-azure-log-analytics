" Settings {{{
" '' = horizontal, 'v' = vertical
let g:azureloganalytics_splittype = get(g:, 'azureloganalytics_splittype', "")
let g:azureloganalytics_bufname = get(g:, 'azureloganalytics_bufname', ".azureloganalytics-search-output.json")
" }}}

" Sanity check {{{
function! azureloganalytics#sanitycheck()
	if(!exists("g:azureloganalytics_appid"))
		throw "Azure Log Analytics: g:azureloganalytics_appid must be set"
	endif

	if(!exists("g:azureloganalytics_apikey"))
		throw "Azure Log Analytics: g:azureloganalytics_apikey must be set"
	endif
endfunction
" }}}

" Search Buffer {{{
function! azureloganalytics#gotobuf()
	let winnr = bufwinnr('^' . g:azureloganalytics_bufname . '$')
	if ( winnr >= 0 )
		execute winnr . 'wincmd w'
		normal! ggdG
	else
		execute g:azureloganalytics_splittype . 'new ' . g:azureloganalytics_bufname
		setlocal buftype=nofile bufhidden=wipe noswapfile
	endif
	setlocal filetype=text
endfunction
" }}}

" query encode {{{
function! azureloganalytics#queryencode(query)
	let l:query = a:query
	let l:query = substitute(l:query, " ", "%20", "g")
	let l:query = substitute(l:query, "|", "%7C", "g")
	let l:query = substitute(l:query, "&", "%26", "g")
	return l:query
endfunction
" }}}

function! azureloganalytics#query(kql) abort
	" Ensure settings were configured
	call azureloganalytics#sanitycheck()

	" Open results buffer
	call azureloganalytics#gotobuf()

	" Wait message
	call setline(1, "\"Searching...\"")
	redraw!
	normal! ggDG

	" Search
	" https://stackoverflow.com/a/44752164/154480
	let l:jq = "
				\ if(.error) then
				\   .
				\ else
				\   def objectify(headers):
				\     [headers, .] | transpose | map( { (.[0]): .[1] } ) | add;
				\   .tables[0]
				\     | (.columns | map(.name)) as $headers
				\     | .rows
				\     | map( objectify($headers) )
				\ end
				\"
	"let l:jq = " then . else .tables[0].rows end"
	let l:cmd = "silent! read! curl" .
		\ " -sS -G -H 'x-api-key: " . g:azureloganalytics_apikey .
		\ "' " . shellescape("https://api.applicationinsights.io/v1/apps/" . g:azureloganalytics_appid . "/query?query=" . azureloganalytics#queryencode(a:kql), 1) . " | jq '" . l:jq . "'"
	"echom l:cmd
	execute l:cmd

	" Prepare results
	setlocal filetype=json
	normal! gg
endfunction
