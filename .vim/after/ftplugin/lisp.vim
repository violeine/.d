nnoremap  <buffer><silent>cp :set opfunc=ToRepl<cr>g@
vnoremap <buffer><silent>cp :<c-u>call ToRepl(visualmode())<cr>
nmap <buffer><silent>cpp cpaf<CR>
nnoremap <buffer><silent><c-q>r :<c-u>call vlime#plugin#CloseWindow("arglist")<cr>
imap <A-CR> <Plug>(PearTreeExpand)
let b:pear_tree_smart_openers=1
let b:pear_tree_smart_closers=1
let b:pear_tree_smart_backspace=1
let b:pear_tree_pairs = {
    \   '(': {'closer': ')'},
    \   '[': {'closer': ']'},
    \   '{': {'closer': '}'},
    \   '"': {'closer': '"'},
    \ }
function! ToRepl(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif
    call vlime#plugin#SendToREPL(@@)
    let @@ = saved_unnamed_register
endfunction
