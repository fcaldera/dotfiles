local set = vim.keymap.set

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Split window management
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
set("n", "<leader>x", "<C-w>c", { desc = "Close the current window" })

-- Control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

-- Keep the cursor in the middle when jumping vertically
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Move selected lines up and down in visual mode
set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected lines down
set("v", "K", ":m '<-2<CR>gv=gv") -- Move selected lines up

-- Increase numbers
-- default <C-a> conflicts with Tmux prefix
set({ "n", "v" }, "+", "<C-a>")
set("x", "g+", "g<C-a>") -- V-Block multiline increment. :help v_g_CTRL-A

-- Alternative delete/replace: avoid registers
set({ "n", "v" }, "<M-d>", '"_d') -- Delete to the void register
set("x", "<M-p>", [["_dP]]) -- Paste to void register

-- Replace all of the word-under-cursor occurrences
local cmd = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
set("n", "<leader>rw", cmd, { desc = "[R]eplace [W]ord under cursor..." })

-- Buffer keymaps
set("n", "<leader>bd", "<cmd>bd %<CR>", { desc = "[B]uffer [D]elete" })

-- Tab keymaps
set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[T]ab close" })

-- Toggle keymaps
set("n", "<leader>tc", function()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  require("cmp").setup({ enabled = not vim.g.copilot_enabled })
end, { desc = "[T]oggle [C]ompletions" })

-- Git keymaps
set("n", "<leader>gs", vim.cmd.Git, { desc = "Git [S]tatus" })
set("n", "<leader>gp", "<cmd>Git push --force-with-lease<CR>", { desc = "Git [P]ush" })
set("n", "<leader>ga", "<cmd>Gwrite<CR>", { desc = "Git [A]dd" })
set("n", "<leader>gr", "<cmd>Gread<CR>", { desc = "Git [R]eload" })
set("n", "<leader>gl", "<cmd>Git log --oneline %<CR>", { desc = "Git [L]og" })
set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git [C]ommit" })
-- set("n", "<leader>gd", vim.cmd.DiffviewOpen, { desc = "Git [D]iff" })
-- set("n", "<leader>gh", vim.cmd.DiffviewFileHistory, { desc = "Git [H]istory" })

-- Browse/View
set("n", "<leader>vf", vim.cmd.GBrowse, { desc = "[V]iew [F]ile" })
set("n", "<leader>vr", "<cmd>!gh repo view -w<CR><ESC>", { desc = "[V]iew [R]epo", silent = true })
set("n", "<leader>vp", "<cmd>!gh pr view -w<CR>", { desc = "[V]iew [P]ull request", silent = true })

-- Komands keymaps
set("n", "<leader>kq", "<cmd>wqa!<CR>", { desc = "[Q]uit" })
set("n", "<leader>kw", "<cmd>w<CR>", { desc = "[W]rite to disk" })
set("n", "<leader>kr", "<cmd>edit! %<CR>", { desc = "[R]eload file" })
set("n", "<leader>ku", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })
set("n", "<leader>ki", vim.cmd.DBUIToggle, { desc = "DBU[I]" })
set("n", "<leader>kx", "<cmd>source %<CR>", { desc = "Source file" })

-- Quickfix navigation
set("n", "[q", ":cprev<CR>zz", { desc = "Jump to previous quickfix item" })
set("n", "]q", ":cnext<CR>zz", { desc = "Jump to next quickfix item" })
set("n", "[Q", ":cfirst<CR>zz", { desc = "Jump to first quickfix item" })
set("n", "]Q", ":clast<CR>zz", { desc = "Jump to last quickfix item" })
set("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
set("n", "<leader>qq", ":cclose<CR>", { desc = "Close quickfix list" })
set("n", "<leader>qd", vim.diagnostic.setloclist, { desc = "Diagnostics" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
