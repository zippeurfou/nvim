return {
  { 'ryanoasis/vim-devicons' },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  { 'lewis6991/gitsigns.nvim',
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
  {
    'j-hui/fidget.nvim',
    tag = "legacy",
    config = function()
      require('fidget').setup {}
    end
  },
  { 'Pocco81/true-zen.nvim',
    config = function()
      require("true-zen").setup {
      }
    end,
  },
  -- {
  --   "luukvbaal/statuscol.nvim", config = function()
  --     -- need to figure out how to make it work
  --     -- local builtin = require("statuscol.builtin")
  --     require("statuscol").setup({
  --       -- configuration goes here, for example:
  --       -- relculright = true,
  --       segments = {
  --         { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --         {
  --           sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
  --           click = "v:lua.ScSa"
  --         },
  --         -- { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
  --       --   {
  --           -- sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
  --       --     click = "v:lua.ScSa"
  --       --   },
  --       }
  --     })
  --   end,
  -- },
  { 'chentoast/marks.nvim',
    config = function()
      require 'marks'.setup {}
    end,
  },
  { 'lukas-reineke/indent-blankline.nvim',
    tag='v2.20.8',
    config = function()
      -- vim.g.indent_blankline_use_treesitter_scope = true
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
        char = '┊',
        show_trailing_blankline_indent = false,
        -- space_char_blankline = " ",
        use_treesitter = false,
      })
    end,
  },
  { 'jbyuki/nabla.nvim',
    config = function()
      require "nabla".enable_virt({
        autogen = true, -- auto-regenerate ASCII art when exiting insert mode
        silent = true, -- silents error messages
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        sections = { lualine_c = { 'buffers' } }
      }
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
  { "bluz71/vim-nightfly-colors", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup()
      vim.cmd("colorscheme tokyonight-night")
    end
  },
}
