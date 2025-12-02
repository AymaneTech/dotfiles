-- Tab settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Line numbers and cursor
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set cursorline")

-- UI improvements
vim.opt.signcolumn = "yes:2"
vim.opt.fillchars = {
  foldopen = "-",
  foldclose = "+",
  fold = "-",
  foldsep = " ",
  diff = "-",
  eob = " ",
}
vim.opt.listchars = {
  tab = "▸ ",
  lead = "·",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "×",
}
vim.cmd("set list")

-- Clipboard and system integration
vim.opt.clipboard = "unnamedplus"

-- Search and navigation
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- Spelling
vim.opt.spelllang = "en"

