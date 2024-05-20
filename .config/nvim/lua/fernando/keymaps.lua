-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ kickstart (previous) ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- Remap for dealing with word wrap
-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ My custom keymaps ]]

-- Git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git [S]tatus" })
-- vim.keymap.set("n", "<leader>gd", vim.cmd.DiffviewOpen, { desc = "Git [D]iff" })
-- vim.keymap.set("n", "<leader>gh", vim.cmd.DiffviewFileHistory, { desc = "Git [H]istory" })

-- Browse/View
vim.keymap.set("n", "<leader>vf", vim.cmd.GBrowse, { desc = "[V]iew [F]ile" })
vim.keymap.set("n", "<leader>vr", "<cmd>!gh repo view -w<CR><ESC>", { desc = "[V]iew [R]epo", silent = true })
vim.keymap.set("n", "<leader>vp", "<cmd>!gh pr view -w<CR>", { desc = "[V]iew [P]ull request", silent = true })

-- Buffers
vim.keymap.set("n", "<leader>bd", "<cmd>bd %<CR>", { desc = "[B]uffer [D]elete" })

-- Toggles
vim.keymap.set("n", "<leader>tc", function()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  require("cmp").setup({ enabled = not vim.g.copilot_enabled })
end, { desc = "[T]oggle [C]ompletions" })

-- Komands keymaps
vim.keymap.set("n", "<leader>kr", "<cmd>edit! %<CR>", { desc = "[R]eload file" })
vim.keymap.set("n", "<leader>kw", "<cmd>w<CR>", { desc = "[W]rite to disk" })
vim.keymap.set("n", "<leader>ku", vim.cmd.UndotreeToggle, { desc = "[U]ndo tree" })
vim.keymap.set("n", "<leader>kt", "<cmd>tabclose<CR>", { desc = "[T]ab close" })

-- Move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Alternative delete/replace: avoid registers
-- vim.keymap.set({ "n", "v" }, "<leader>kd", '"_d', { desc = "[D]elete to the void register" })
-- vim.keymap.set("x", "<leader>cp", [["_dP]], { desc = "[P]aste to void register" })

-- Keep the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace all of the word-under-cursor occurrences
vim.keymap.set(
  "n",
  "<leader>rw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "[R]eplace [W]ord under cursor..." }
)

-- Increase/decrease numbers (17)
vim.keymap.set({ "n", "v" }, "<M-=>", "<C-a>", { desc = "Increase numbers" })
vim.keymap.set({ "n", "v" }, "<M-->", "<C-x>", { desc = "Decrease numbers" })

-- Quickfix navigation. Commented until I know what the heck is that
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- The primeagen said that Q was the worst place in the universe.
-- I still don't know why, but here we are!
-- vim.keymap.set("n", "Q", "<nop>")

-- Control the size of splits (height/width)
vim.keymap.set("n", "<M-,>", "<c-w>5<")
vim.keymap.set("n", "<M-.>", "<c-w>5>")
vim.keymap.set("n", "<M-t>", "<C-W>+")
vim.keymap.set("n", "<M-s>", "<C-W>-")

-- vim: ts=2 sts=2 sw=2 et
