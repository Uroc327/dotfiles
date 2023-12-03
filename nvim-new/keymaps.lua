-- read :h motion.txt

-- [[ Change Neovim Defaults ]]

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Leave alone registers
vim.keymap.set("", "s", '"_s', { remap = false })
vim.keymap.set("", "d", '"_d', { remap = false })
vim.keymap.set("", "D", '"_D', { remap = false })
vim.keymap.set("n", "dd", '"_dd', { remap = false })
vim.keymap.set("v", "p", "pgvy", { remap = false })

-- Don't jump on * and g*
vim.keymap.set(
	"n",
	"*",
	"v:count ?  '*' : '<Cmd>keepjumps normal!  *<CR><Cmd>call winrestview(' .. string(winsaveview()) .. ')<CR>'",
	{ remap = false }
)
vim.keymap.set(
	"n",
	"g*",
	"v:count ? 'g*' : '<Cmd>keepjumps normal! g*<CR><Cmd>call winrestview(' .. string(winsaveview()) .. ')<CR>'",
	{ remap = false }
)

-- Reselect after indenting lines
vim.keymap.set("x", "<", "<gv", { remap = false })
vim.keymap.set("x", ">", ">gv", { remap = false })

-- [[ New Mappings ]]

-- Scrolling (see scrolling)
vim.keymap.set("i", "<C-y>", "<Esc><C-y>a")
vim.keymap.set("i", "<C-e>", "<Esc><C-e>a")
vim.keymap.set("", "<C-M-y>", "<C-y><Up>")
vim.keymap.set("", "<C-M-e>", "<C-e><Down>")

-- Begin and end
vim.keymap.set("", "<leader><leader>h", "0", { desc = "Jump to beginning of line" })
vim.keymap.set("", "<leader>h", "^", { desc = "Jump to beginning of content" })
vim.keymap.set("", "<leader>l", "$", { desc = "Jump to end of line" })

-- Save and close (let's try with autosave for now)
--vim.keymap.set("", "<C-s>", ":wa<CR>")
--vim.keymap.set("i", "<C-s>", "<Esc>:wa<CR>a")
vim.cmd.cabbrev("qq", "q!")

-- Esc in terminal
vim.keymap.set("t", "<C-Esc>", "<C-><C-n>", { desc = "<Esc> from :term" })

-- Cut line
vim.keymap.set("n", "xx", "Vx", { remap = false, desc = "Cut whole line" })

-- Clear search
vim.keymap.set("", "<Leader>/", function()
	vim.fn.setreg("/", "")
end, { desc = "Clear Search" })

-- Move characters
vim.keymap.set("", "<C-h>", '""xh""P', { desc = "Move character left" })
vim.keymap.set("", "<C-l>", '""x""p', { desc = "Move character right" })

-- Move lines
vim.keymap.set("n", "<C-k>", "<Cmd>m--<CR>", { desc = "Move line up" })
vim.keymap.set("n", "<C-j>", "<Cmd>m+<CR>", { desc = "Move line down" })
vim.keymap.set("x", "<C-k>", "<Cmd>'<,'>m'<-- <Bar> keepjumps normal! gv<CR>", { desc = "Move selection up" })
vim.keymap.set("x", "<C-j>", "<Cmd>'<,'>m'>+ <Bar> keepjumps normal! gv<CR>", { desc = "Move selection down" })

-- Duplicate line
vim.keymap.set("n", "tk", "<Cmd>t-<CR>", { desc = "Duplicate line up" })
vim.keymap.set("n", "tj", "<Cmd>t.<CR>", { desc = "Duplicate line down" })

-- F5 to build/exec
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.keymap.set("n", "<F5>", "<Cmd>w<CR><Cmd>!latexmk %<CR>")
	end,
}, { desc = "Build with latexmk" })

-- F6 to REPL
-- not implemented yet

-- F7 to quickfix (TODO see if I want something from diagnostics/lsp/telescope here)
vim.keymap.set("", "<F7>", vim.cmd.copen, { desc = "Open Quickfix" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
--vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" }) telescope should be sufficient (also, clash with camel case motion)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Toggle Numbers
vim.keymap.set("n", "<leader>n", function()
	newnum = not vim.o.number
	vim.o.number = newnum
	vim.o.relativenumber = newnum
end, { desc = "Toggle numbers" })

-- Create headings with matching line lengths for ascii docs
vim.keymap.set("n", "<leader><Space>=", "tkVr=j", { desc = "Add heading delimiter of = above" })
vim.keymap.set("n", "<leader><Space>-", "tkVr-j", { desc = "Add heading delimiter of - above" })
vim.keymap.set(
	"n",
	"<leader><leader><space>=",
	"kdd<leader><space>=",
	{ desc = "Replace heading delimiter of = above" }
)
vim.keymap.set(
	"n",
	"<leader><leader><space>-",
	"kdd<leader><space>-",
	{ desc = "Replace heading delimiter of - above" }
)

-- Diffs
vim.keymap.set("", "<C-d>", vim.cmd.diffthis, { desc = "Add current file to diff" })
vim.keymap.set("", "<M-d>", vim.cmd.diffoff, { desc = "Remove current file from diff" })

-- Change dir to current file
vim.keymap.set("", "<C-f>", function()
	vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
	vim.cmd.pwd()
end, { desc = "Change dir to current file" })

-- vim: ts=2 sts=2 sw=2 noet
