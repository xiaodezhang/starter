vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

-- Auto resize panes when resizing nvim window
local autocmd = vim.api.nvim_create_autocmd
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.opt.colorcolumn = '79'
-- 设置 Consolas 字体，字号 12
-- vim.opt.guifont = { "Consolas", ":h12" }
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    vim.o.guifont = "Consolas:h12"
  end
})

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_set_keymap('n', '<F5>', ':silent !start cmd /c start.bat<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })

-- F6 打开 PowerShell
vim.keymap.set("n", "<F6>", function()
  vim.cmd("!start pwsh -NoExit -Command \"cd " .. vim.fn.getcwd() .. "\"")
end, { silent = true, desc = "Open pwsh in current working dir" })
