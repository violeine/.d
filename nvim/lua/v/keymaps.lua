local map = vim.keymap.set

map("n", "<ESC><ESC>", ":nohlsearch<CR>", { silent = true })

map("n", "'", "`", { silent = true })
map("n", "`", "'", { silent = true })

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "]w", "gt", { silent = true })
map("n", "[w", "gT", { silent = true })

vim.cmd([[
  augroup keymap
  autocmd!
  autocmd FileType qf,help,man,lspinfo,notify,query,startuptime nnoremap <silent> <buffer> q :close<CR>
  autocmd CmdwinEnter * nnoremap <buffer> <esc><esc> :close<cr>
]]) --quit thing easily

--Stay in indent mode
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })
