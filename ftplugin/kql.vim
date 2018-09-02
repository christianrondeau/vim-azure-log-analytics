if exists("b:kql_loaded")
  finish
endif

nnoremap <silent> <buffer> <cr> :call azureloganalytics#query(join(getline(1, '$'), "\n"))<cr>

imap <silent> <buffer> <cr> <cr><bar><space>

let b:kql_loaded = 1
