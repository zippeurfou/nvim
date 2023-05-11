local Util = require("zippeurfou.util")
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.fn.sign_define("DiagnosticSignError",
        { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn",
        { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo",
        { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint",
        { text = "", texthl = "DiagnosticSignHint" })
      require("neo-tree").setup({
        filesystem = {
          hide_gitignored = false,
          hide_hidden = false,
        },
        default_component_configs = {
          git_status = {
            symbols = {
              -- Change type
              added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖", -- this can only be used in the git_status source
              renamed   = "", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
        },
      })
    end,
  },
  { "qpkorr/vim-bufkill", },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader><leader>b", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      -- find
      { "<leader><leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader><leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader><leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader><leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- git
      { "<leader><leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader><leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { "<leader><leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader><leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader><leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader><leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader><leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader><leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader><leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader><leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader><leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader><leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader><leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader><leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader><leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader><leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
      { "<leader><leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
      { "<leader><leader>cs", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
      {
        "<leader>ss",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-i>"] = function()
              Util.telescope("find_files", { no_ignore = true })()
            end,
            ["<a-h>"] = function()
              Util.telescope("find_files", { hidden = true })()
            end,
            ["<C-d>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-u>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
      },
    },
  },
  {
    'hkupty/iron.nvim',
    config = function()
      local iron = require("iron.core")
      iron.setup {
        config = {
          highlight_last = false,
          scratch_repl = true,
          -- Automatically closes the repl window on process end
          close_window_on_exit = true,
          repl_open_cmd = "horizontal 10 split",
          repl_definition = {
            sh = { command = { "zsh" } },
            python = require("iron.fts.python").ipython
          },
        },
        should_map_plug = true,
        keymaps = {
          send_motion = "<leader>iss",
          visual_send = "<leader>iss",
          send_line = "<leader>isl",
          send_file = "<leader>isf",
          -- repeat_cmd = "<leader>is.",
          cr = "<leader>is<cr>",
          interrupt = "<leader>isi",
          exit = "<leader>isq",
          clear = "<leader>isl",
        },
        highlight = false,
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }
    end,
  },
}
