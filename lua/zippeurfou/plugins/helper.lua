return {
  -- show help when typing stuff. Help me :)
  {"folke/which-key.nvim",
  config = function()
    require("which-key").setup()
      local wk = require("which-key")
      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gd"] = { name = "+gotodefinition" },
        ["gr"] = { name = "+rename" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["K"] = { name = "+hoverdoc" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>p"] = { name = "+paste" },
        ["<leader>s"] = { name = "+showdiagnostic" },
      })
  end,
  },
  -- show colors when typing :ColorizerAttachToBuffer
  {"norcalli/nvim-colorizer.lua"},
  -- strip whitespace
  {'echasnovski/mini.trailspace',
  config = function()
    require('mini.trailspace').setup()
  end,
  },
  -- comment with gcc and co
    {'numToStr/Comment.nvim',
    config = function()
       require('Comment').setup()
    end,
  },
  {"kkoomen/vim-doge",
    build = function()
    vim.cmd(':call doge#install()')
    end,
    config = function()
    vim.g.doge_mapping = '<Leader>d'
    end,
  }
}

