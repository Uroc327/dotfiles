
vim.o.clipboard = "unnamedplus"
vim.o.diffopt = "followwrap"
vim.o.display = ""
vim.o.expandtab = false
vim.o.foldenable = false
vim.o.formatoptions = "roqlj"
--vim.opt.grepprg=grep\ -in\ $*\ /dev/null
vim.o.ignorecase = true
vim.o.infercase = true
vim.o.list = true
vim.o.listchars = "tab:· ,trail:·,extends:»,precedes:«,nbsp:~"
vim.o.mouse = "v"
vim.o.scrolloff = 2
vim.o.shiftwidth = 4
vim.o.sidescrolloff = 2
vim.o.smartcase = true
vim.o.smarttab = false
vim.o.softtabstop = 0
vim.o.tabstop = 4
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.virtualedit = "all"
vim.o.wrap = false

vim.opt.completeopt = {"menuone", "noinsert", "noselect" }

vim.o.termguicolors = true

-- Disable unused langauge providers
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- vim: ts=2 sts=2 sw=2 noet
