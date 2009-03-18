iab def def<CR>end<UP><END>
iab do do<CR>end<UP><END>
iab class class<CR>end<UP><END>
iab module module<CR>end<UP><END>
iab require_local require File.expand_path('', File.dirname(__FILE__))<C-o>F'
inoremap <buffer> ( ()<LEFT>
inoremap <buffer> () ()
inoremap <buffer> [ []<LEFT>
inoremap <buffer> [] []
inoremap <buffer> { {}<LEFT>
inoremap <buffer> {} {}
nnoremap <buffer> <F6> :update<CR>:!ruby %<CR>

function! BaconContext()
    let l:saved = getpos(".")
    let l:context_line = search("^describe", "b")
    let l:context_name = substitute(getline("."),"describe \\(.*\\) do", "\\1", "")
    exec "!bacon % -t " . l:context_name
    call setpos('.',l:saved)
endfunction
function! BaconTest()
    let l:saved = getpos(".")
    let l:context_line = search("^\\s*should .* do", "b")
    let l:context_name = substitute(getline("."),"^\\s*should \\(.*\\) do", "\\1", "")
    exec "!bacon % -n " . l:context_name
    call setpos('.',l:saved)
endfunction

nnoremap <buffer> <F7> :update<cr>:call BaconContext()<cr>
nnoremap <buffer> <F8> :update<cr>:call BaconTest()<cr>
