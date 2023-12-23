vim.cmd([[
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[2 q"
]])

vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- ui
vim.o.splitbelow = true
vim.o.splitright = true
vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.wo.cursorline = true
vim.wo.colorcolumn = "80"

vim.o.pumblend = 20
vim.o.pumheight = 10

vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.undofile = true

vim.o.updatetime = 250

vim.o.termguicolors = true

vim.o.completeopt = "menu,menuone,noselect"
vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.laststatus = 3
vim.o.expandtab = false

vim.opt.fillchars = {
	vert = "▕", -- alternatives │
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

vim.opt.listchars = {
	eol = "¬",
	tab = ">·",
	trail = "~",
	extends = ">",
	precedes = "<",
	space = "·",
}

-- map leader before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local settings_group = vim.api.nvim_create_augroup("Settings", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = settings_group,
	pattern = "*",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	command = "%s/s+$//e",
	group = settings_group,
	pattern = "*",
})

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.cmd([[normal! g`"]])
		end
	end,
	pattern = "*",
	group = settings_group,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	command = "set formatoptions-=cro",
	pattern = "*",
	group = settings_group,
})
