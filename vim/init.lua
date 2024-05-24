--[[

          /\                 \\
        //  \\               # \\
      //   |  \\             #   \\
    // \   |    \\           #     \\
   #     \ |      \\         #       #
   #      \         \\       #       #
   #       #\         \\     #       #
   #       #  \         \\   #       #
   #       #    \         \\ #       #
   #       #      \         \#       #
   #       #        \         \      #
   #       #          \       | \    #
    \\     #            \     |     //
      \\   #              \   |   //
        \\ #                \   //
          \\                  \/

--]]

-- ====== Appearance ======
vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.laststatus = 2
vim.opt.langmenu = 'en_US'
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.clipboard = 'unnamedplus'
vim.api.nvim_create_autocmd({'BufReadPost'}, {
  desc = 'Open file at the last position',
  pattern = '*',
  command = 'silent! normal! g`"zv'
})


-- ====== Serach ======
vim.opt.wrapscan = false
vim.opt.hlsearch = true
vim.keymap.set('v', '*', '"zy:let @/ = @z<CR>n', { noremap = true, silent = true })


-- ====== Parentheses ======
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.keymap.set('i', '{',  '{}<Left>',   { noremap = true, silent = true })
vim.keymap.set('i', '[',  '[]<Left>',   { noremap = true, silent = true })
vim.keymap.set('i', '(',  '()<Left>',   { noremap = true, silent = true })
vim.keymap.set('i', '\'', '\'\'<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '"',  '""<Left>',   { noremap = true, silent = true })


-- ====== Movements ======
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 16

-- Emcas key binds in insert mode
vim.keymap.set('i', '<C-b>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-f>', '<Right>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-a>', '<Home>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-e>', '<End>', { noremap = true, silent = true })

-- Emcas key binds in command mode
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true, silent = true })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true, silent = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true, silent = true })


-- ====== Keybindings ======
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = vim.keycode('<Space>')

vim.keymap.set('n', 'Y', 'y$', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>V', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gn', ':bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gp', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gd', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>c', ':cd %:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true })


-- ====== Plugins ======
require('plugins')
