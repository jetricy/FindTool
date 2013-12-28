
" Public Interface:
command! -nargs=* -complete=dir Find call <SID>Find (<f-args>)

function! <SID>Find(srcA,srcB)
	silent! exe "!find " . a:srcA . " -name " . a:srcB . ">/tmp/dir.find"
	silent! exe "!sed \"s/\\$/|1| ./g\" /tmp/dir.find > /tmp/dir.find.tt"
	silent! exe "!rm /tmp/dir.find"
	silent! exe "!mv /tmp/dir.find.tt /tmp/dir.find"
	silent! exe "cf /tmp/dir.find"
endfunction
