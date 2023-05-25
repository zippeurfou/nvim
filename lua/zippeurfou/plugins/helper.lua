return {
  -- show help when typing stuff. Help me :)
  { "folke/which-key.nvim",
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
        ["<leader>D"] = { name = "+debug" },
        ["<leader>i"] = { name = "+iron" },
        ["<leader>is"] = { name = "+send" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>p"] = { name = "+paste" },
        ["<leader>s"] = { name = "+showdiagnostic" },
        ["<leader>z"] = { name = "+zen" },
        ["<leader>T"] = { name = "+telescope" },
        ["<leader>Tf"] = { name = "+find" },
        ["<leader>Ts"] = { name = "+search" },
        ["<leader>Tg"] = { name = "+git" },
        ["<leader>Tc"] = { name = "+colorscheme" },
      })
    end,
  },
  -- show colors when typing :ColorizerAttachToBuffer
  { "norcalli/nvim-colorizer.lua" },
  -- strip whitespace
  { 'echasnovski/mini.trailspace',
    config = function()
      require('mini.trailspace').setup({})
    end,
  },
  -- comment with gcc and co
  { 'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  { "kkoomen/vim-doge",
    build = function()
      vim.cmd(':call doge#install()')
    end,
    config = function()
      vim.g.doge_mapping = '<Leader>h'
    end,
  },
  { "iamcco/markdown-preview.nvim",
    config = function() vim.fn["mkdp#util#install"]() end, },
}
