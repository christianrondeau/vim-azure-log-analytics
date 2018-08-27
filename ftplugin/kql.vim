if exists("b:kql_loaded")
  finish
endif

nmap <silent> <buffer> <cr> :call azureloganalytics#query(join(getline(1, '$'), "\n"))<cr>

let b:kql_loaded = 1
