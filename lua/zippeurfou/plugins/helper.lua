return {
  -- show help when typing stuff. Help me :)
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
      local wk = require("which-key")
      wk.register({
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gd"] = { name = "+gotodefinition" },
        ["gr"] = { name = "+rename" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["K"] = { name = "+hoverdoc" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>D"] = { name = "+debug" },
        ["<leader>i"] = { name = "+iron" },
        ["<leader>is"] = { name = "+send" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>C"] = { name = "+cody" },
        ["<leader>H"] = { name = "+harpoon" },
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
  -- autocomplete
  {
    'David-Kunz/gen.nvim',
    config = function()
      require('gen').model = 'zephyr' -- default 'mistral:instruct', best model? codellama:34b-code-q4_K_M
      -- require('gen').model = 'codellama:7b-code-q4_K_M' -- default 'mistral:instruct', best model? codellama:34b-code-q4_K_M
    end,
  },
  -- strip whitespace
  {
    'echasnovski/mini.trailspace',
    config = function()
      require('mini.trailspace').setup({})
    end,
  },
  -- comment with gcc and co
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    "kkoomen/vim-doge",
    build = function()
      vim.cmd(':call doge#install()')
    end,
    config = function()
      vim.g.doge_mapping = '<Leader>h'
      vim.g.doge_doc_standard_python = 'google'
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function() vim.fn["mkdp#util#install"]() end,
  },
}
