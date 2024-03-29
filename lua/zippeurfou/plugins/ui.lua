return {
  { 'ryanoasis/vim-devicons' },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  {
    'lewis6991/gitsigns.nvim',
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
  {
    'Pocco81/true-zen.nvim',
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
  {
    'chentoast/marks.nvim',
    config = function()
      require 'marks'.setup {}
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v2.20.8',
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
  {
    'jbyuki/nabla.nvim',
    config = function()
      require "nabla".enable_virt({
        autogen = true, -- auto-regenerate ASCII art when exiting insert mode
        silent = true,  -- silents error messages
      })
    end,
  },
  {
    "sourcegraph/sg.nvim",
    config = function()
      require("sg").setup({})
      local ok_wk, wk = pcall(require, 'which-key')
      if not ok_wk then
        print('plugins/sg.lua: missing requirements')
        return
      end
      -- Cody stuff
      function search_diagnostics_cody()
        local start_line, end_line
        local mode = string.lower(vim.fn.mode())
        if mode == "v" then
          start_line = vim.fn.line("v")
          end_line = vim.fn.line(".")
          if start_line > end_line then
            start_line, end_line = end_line, start_line
          end
        else
          start_line = vim.fn.line(".")
          end_line = start_line
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local all_diagnostics = vim.diagnostic.get(bufnr)
        local diagnostics = {}
        for _, diagnostic in ipairs(all_diagnostics) do
          if diagnostic.lnum + 1 >= start_line and diagnostic.lnum < end_line then
            table.insert(diagnostics, diagnostic)
          end
        end

        if #diagnostics == 0 then
          vim.notify("No diagnostics", vim.log.levels.WARN)
          return
        end

        local index = 1
        if #diagnostics > 1 then
          local inputList = { "Which diagnostic do you want explained?:" }
          for i, diagnostic in ipairs(diagnostics) do
            table.insert(inputList, string.format("%d. %s", i, diagnostic.message))
          end
          index = vim.fn.inputlist(inputList)
          if index <= 0 or index > #diagnostics then
            vim.notify("No diagnostic selected", vim.log.levels.INFO)
            return
          end
        end

        local clean_message = diagnostics[index].message:gsub("[A-Za-z0-9:/\\._%-]+[.][A-Za-z0-9]+", "")
        clean_message = clean_message:gsub("[A-Za-z0-9:/\\._%-]+[/\\][A-Za-z0-9:/\\._%-]+[.][A-Za-z0-9]+", "")
        local msg =
        "You are an expert coder and helpful assistant who can help debug code diagnostics, such as warning and error messages."
        ..
        "When appropriate, give solutions with code snippets as fenced codeblocks with a language identifier to enable syntax highlighting.\n"
        .. "This is a the diagnostic message for the code:\n"
        .. clean_message

        require("sg.cody.commands").ask_range(bufnr, start_line - 1, end_line, msg)
      end

      local doc_msg = "Add Docstring and arguments types hints and return types hints to the whole code."
      .. "For types hints leverage the typing package."
      .. "DO NOT ADD NEW PACKAGE IMPORT."
      .. "Follow Google Python Style Guide, add type hints to the arguments in the docstring inside parenthesis."
      .. "Following this convention name (type hints): Description."
      .. "If there is no type hints DO ADD them."
      .. "When applicable, add sections such as Args, Returns, Attributes, Todos, Notes, See Also, Warnings, Raises, etc..."
      .. "Provide clear technical description."
      .. "If the method is missing the class definition DO NOT CREATE ONE BUT KEEP self if provided."
      -- .. "If a class is provided MAKE SURE TO ADD AS MUCH DOCSTRING AS POSSIBLE."
      .. "DO NOT CHANGE ANY CODE OR COMMENTS BESIDE WHAT INSTRUCTED."
      .. "Use tabs instead of space for indentation."
      .. "Strip whitespaces."
      .. "DO NOT MAKE ANYTHING UP, USE FACT ONLY."

      wk.register({
        name = '+cody',
        c = { ':CodyToggle<cr>', '[C]ody [T]oggle' },
        r = { ':CodyRestart<CR>', '[C]ody [R]estart' },
        C = { ':CodyChat<CR>', '[C]ody [C]hat' },
        R = { ':CodyChat!<CR>', '[C]ody chat [R]eset' },
        t = { ':CodyTask ', '[C]ody [T]ask Create' },
        v = { ':CodyTaskView<CR>', '[C]ody Task [V]iew' },
        a = { ':CodyTaskAccept<CR>', '[C]ody Task [A]ccept' },
        p = { ':CodyTaskPrev<CR>', '[C]ody Task [P]revious' },
        n = { ':CodyTaskNext<CR>', '[C]ody Task [N]ext' },
        -- Custom stuff
        d = { ":CodyTask "..doc_msg.."<CR>", "[C]ody [d]ocumentation Generate" },
        D = {search_diagnostics_cody, "[C]ody [D]iagnostic Search"},
        -- Steal stuff from https://github.com/undg/.dot/blob/aed6fb4b2a11463d8004a5b8c384bf07df4e4324/vim/.config/nvim/lua/plugins/sg.lua
        -- a = {
        --   name = 'automation',
        --   s = { ai.text.proofread.get, ai.text.proofread.desc },
        --   r = { ai.readme.body.get, ai.readme.body.desc },
        --   p = { ai.pull_request.description.get, ai.pull_request.description.desc },
        --   g = {
        --     name = 'git',
        --     C = { ai.commit.open_with_message.get, ai.commit.open_with_message.desc },
        --     c = { ai.commit.message.get, ai.commit.message.desc },
        --     t = { ai.commit.title.get, ai.commit.title.desc },
        --   },
        -- },
      }, { prefix = '<leader>C', mode = 'n' })

      wk.register({
        name = '+cody',
        a = { ':CodyAsk ', '[C]ody [A]sk' },
        t = { ':CodyTask ', '[C]ody [T]ask Create' },
        -- Custom stuff
        d = { ":CodyTask "..doc_msg.."<CR>", "[C]ody [d]ocumentation Generate" },
        D = {search_diagnostics_cody, "[C]ody [D]iagnostic Search"},
      }, { prefix = '<leader>C', mode = 'v', silent = false })
    end,
    dependencies = { "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]] },

    -- If you have a recent version of lazy.nvim, you don't need to add this!
    build = "nvim -l build/init.lua",
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        sections = { lualine_c = { 'buffers' } },
        disabled_filetypes = {
          "dapui_watches", "dapui_breakpoints",
          "dapui_scopes", "dapui_console",
          "dapui_stacks", "dap-repl"
        },
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
  { "EdenEast/nightfox.nvim",     lazy = true },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup()
      vim.cmd("colorscheme tokyonight-night")
    end
  },
}
