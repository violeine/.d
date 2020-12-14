nnoremap  <buffer><silent>cp :set opfunc=ToRepl<cr>g@
vnoremap <buffer><silent>cp :<c-u>call ToRepl(visualmode())<cr>
nmap <buffer><silent>cpp cpaf<CR>

function! ToRepl(type)
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif
    call vlime#plugin#SendToREPL(@@)
endfunction
