return {
  {'ryanoasis/vim-devicons'},
 { 'nvim-tree/nvim-web-devicons', lazy = true },
  {'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup(
        {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        }
      )
    end,
  },
  {'lukas-reineke/indent-blankline.nvim',
    config = function()
      -- vim.g.indent_blankline_use_treesitter_scope = true
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
        char = '┊',
        show_trailing_blankline_indent =false,
        -- space_char_blankline = " ",
        use_treesitter=false,
      })
    end,
  },
  -- {
  --   -- "ellisonleao/gruvbox.nvim",
  --   "morhetz/gruvbox",
  --   lazy=true,
  --    -- priority = 1000,
  --   config = function()
  --     -- vim.g.gruvbox_contrast_dark='dark'
  --   -- vim.o.background = "dark" -- or "light" for light mode
  --   -- require("gruvbox").setup({
  --       -- inverse = false,
  --       -- invert_selection = false,
  --     -- })
  --   -- vim.cmd("colorscheme gruvbox")
  --   end,
  -- },
  {"bluz71/vim-nightfly-colors", lazy=true},
  {"EdenEast/nightfox.nvim", lazy=true},
  {"folke/tokyonight.nvim",
    config=function()
      require("tokyonight").setup()
    vim.cmd("colorscheme tokyonight-night")
    end
  },
}
