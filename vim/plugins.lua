-- ==== https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ==== nvim-tree requirements ====
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ==== Install plugins ====
require('lazy').setup({
  -- ==== https://github.com/nvim-tree/nvim-tree.lua
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
      vim.o.background = 'dark' -- or 'light'
      vim.cmd.colorscheme('solarized')
    end,
  },
  -- ==== https://github.com/nvim-tree/nvim-web-devicons
  {
    'nvim-tree/nvim-web-devicons'
  },
  -- ==== https://github.com/nvim-tree/nvim-tree.lua
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<C-e>', ':NvimTreeOpen<CR>', noremap = true, silent = false }
    },
    opts = {
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    },
    config = function ()
      local function my_on_attach(bufnr)
        local api = require('nvim-tree.api')
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.del('n', '<C-e>', { buffer = bufnr })
        vim.keymap.set('n', 'l', api.node.open.edit, { buffer = bufnr, noremap = true, silent = false })
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, { buffer = bufnr, noremap = true, silent = false })
      end
      require('nvim-tree').setup({
        on_attach = my_on_attach,
      })
    end,
  },
  -- ==== https://github.com/nvim-treesitter/nvim-treesitter 
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { 'lua', 'vim', 'javascript', 'typescript', 'perl', 'python', 'markdown', 'markdown_inline' },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  },
  -- ==== https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'solarized',
        disabled_filetypes = { 'NvimTree' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_b = {
          { 'branch', icon = '' }
        },
      },
    },
  },
  -- ==== https://github.com/akinsho/bufferline.nvim
  {
    'akinsho/bufferline.nvim',
    version = '*',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  -- ==== https://github.com/terrastruct/d2-vim
  {
    'terrastruct/d2-vim',
    ft = 'd2',
  },
  -- ==== https://github.com/vim-perl/vim-perl
  {
    'vim-perl/vim-perl',
    ft = 'perl',
  },
  -- ==== https://github.com/junegunn/fzf.vim
  {
    'junegunn/fzf',
    lazy = false,
  },
  {
    'junegunn/fzf.vim',
    lazy = false,
  },
  -- ==== https://github.com/dense-analysis/ale
  {
    'dense-analysis/ale',
    config = function()

    end
  },
})
