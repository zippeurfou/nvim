-- All the remap I can do
-- TODO: Figure out how to add the one that are part of plugins
-- Change mapleader
vim.g.mapleader = ","
vim.g.wordmotion_prefix = '<leader>'
local function map(mode, keys, action, description)
  local options = { noremap = true, silent = true, desc = description }
  vim.keymap.set(mode, keys, action, options)
end

-- doge is annoying
vim.g.doge_mapping = '<Leader>h'
map("n", "<leader>st", function() MiniTrailspace.trim() end, "[S][t]rip Whitespace")
-- Copy paste binding
map("x", "<leader>pp", [["_dP]], 'Past Previous copied selection')
map({ "x", "n", "v" }, "<leader>pc", '"+p', 'Past Clipboard (CTR+V) after')
map({ "x", "n", "v" }, "<leader>pC", '"+P', 'Past Clipboard (CTR+V) before')
map({ "n", "v" }, "<leader>y", [["+y]], 'Copy to Clipboard (CTR+C)')
map("n", "<leader>Y", [["+Y]], 'Copy to Clipboard (CTR+C) whole line')
-- Buffer stuff
map({ "n", "v" }, "<leader>d", [["_d]], 'Delete to Buffer ?')
map("n", "<leader>t", ':NeoTreeFocusToggle<cr>', 'Open Explorer Tree')
map("n", "[b", "<cmd>bprevious<cr>", "Prev buffer")
map("n", "]b", "<cmd>bnext<cr>", "Next buffer")
-- map("n", "<leader>n", 'o-<space><space><ESC>"=strftime("%m/%d/%y")<CR>P i:<space>', 'Add Bragg entry')
map('n', '<leader>it', '<cmd>IronRepl<cr>', '[I]ron [T]oggle')
map('n', '<leader>ir', '<cmd>IronRestart<cr>', '[I]ron [R]estart')
map('n', '<leader>if', '<cmd>IronFocus<cr>', '[I]ron [F]ocus')
map('n', '<leader>ih', '<cmd>IronHide<cr>', '[I]ron [H]ide')
map("n", "<leader>zn", ":TZNarrow<CR>", '[Z]en [N]arrow')
map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", '[Z]en [N]arrow')
map("n", "<leader>zf", ":TZFocus<CR>", '[Z]en [F]ocus toggle')
map("n", "<leader>zm", ":TZMinimalist<CR>", '[Z]en [M]inimalist')
map("n", "<leader>za", ":TZAtaraxis<CR>", '[Z]en [A]tarix')
map("n", "<C-w>m", ":TZFocus<CR>", 'Maximize window')
-- harpoon
map("n", "<leader>Ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", "[H]arpoon [A]dd file")
map("n", "<leader>Hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", "[H]arpoon [N]ext")
map("n", "<leader>Hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "[H]arpoon [P]revious")
map("n", "<leader>Ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "[H]arpoon [T]oggle")
-- debug stuff
-- neotest
map("n", "<leader>Dm", "<cmd>lua require('neotest').run.run()<cr>", "Test [M]ethod")
map("n", "<leader>DM", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test [M]ethod DAP")
map("n", "<leader>Df", "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class")
map("n", "<leader>DF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
  "Test Class DAP")
map("n", "<leader>DS", "<cmd>lua require('neotest').summary.toggle()<cr>", "Test [S]ummary")
-- dap
map("n", "<leader>Db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "[B]reakpoint")
map("n", "<leader>Dc", "<cmd>lua require'dap'.continue()<cr>", "[C]ontinue")
map("n", "<leader>Di", "<cmd>lua require'dap'.step_into()<cr>", "[I]nto")
map("n", "<leader>Do", "<cmd>lua require'dap'.step_over()<cr>", "[O]ver")
map("n", "<leader>DO", "<cmd>lua require'dap'.step_out()<cr>", "[O]ut")
-- map("n", "<leader>Dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "[R]epl toggle")
map("n", "<leader>Dr", function() require("dapui").toggle({ layout = 2, reset = true }) end, "[R]epl toggle")
map("n", "<leader>DR", function() require("dap").restart_frame() end, "[R]estart dap")
map("n", "<leader>DC", function() require("dap").run_to_cursor() end, "Run To [C]ursor")
map("n", "<leader>Dl", "<cmd>lua require'dap'.run_last()<cr>", "[L]ast")
map("n", "<leader>Du", "<cmd>lua require'dapui'.toggle()<cr>", "[U]I")
map("n", "<leader>Dt", "<cmd> lua require'neotest'.output_panel.toggle()<cr>", "[T]erminal")
map("n", "<leader>DT", function() require("dapui").toggle({ layout = 3, reset = true }) end, "[T]erminal dap")
-- map("n", "<leader>Dt", function()
--   local dapui = require("dapui")
--
--   local function open_in_tab(element)
--     local buffer = dapui.elements[element].buffer()
--     vim.cmd("tabnew")
--     vim.api.nvim_win_set_buf(0, buffer)
--     require("dapui").setup({
--       layouts = { {
--         elements = { {
--           id = "scopes",
--           size = 0.25
--         }, {
--           id = "breakpoints",
--           size = 0.25
--         }, {
--           id = "stacks",
--           size = 0.25
--         }, {
--           id = "watches",
--           size = 0.25
--         } },
--         position = "left",
--         size = 40
--       }, {
--         elements = { {
--           id = "console",
--           size = 1
--         } },
--         position = "bottom",
--         size = 10
--       } },
--     })
--   end
--   open_in_tab("repl")
-- end
--   , "[T]erminal")
map("n", "<leader>De", function() require("dap").close() end, "[E]xit Session")
map("n", "<leader>DE", "<cmd>lua require'dap'.terminate()<cr>", "[E]xit kill")
map({ "n", "v" }, "<leader>Dh", "<cmd>lua require('dap.ui.widgets').hover()<cr>", "[H]over")
map({ "n", "v" }, "<leader>Dp", "<cmd>lua require('dap.ui.widgets').preview()<cr>", "[P]review")
map("v", "<leader>DE", function() require("dapui").eval() end, "[E]valuate Input")
map("v", "<leader>Ds", function() require('dap-python').debug_selection() end, "[S]end selection (Python)")
map("n", "<leader>De", "<cmd>lua require'dap'.terminate()<cr>", "[E]xit")
map("n", "<leader>Ds", function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end
, "[S]copes")
map("n", "<leader>Dw", function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end
, "[W]idget frames")

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
map("v", "<leader>CD", search_diagnostics_cody, "[C]ody [D]iagnostic")

-- function doc_cody()
--   local start_line, end_line
--   local mode = string.lower(vim.fn.mode())
--   if mode == "v" then
--     start_line = vim.fn.line("v")
--     end_line = vim.fn.line(".")
--     if start_line > end_line then
--       start_line, end_line = end_line, start_line
--     end
--   else
--     start_line = vim.fn.line(".")
--     end_line = start_line
--   end
--
--   local bufnr = vim.api.nvim_get_current_buf()
--
--
--   local msg = "<cmd>CodyTask Add Docstring to the code."
--     .. "Follow Google convention and make sure to add types to the arguments in the docstring inside parenthesis."
--     .. "Make sure to add docstring to the class if present including as many as possible information from __init__"
--     .. "such as Args, Returns, References, Examples, Attributes, Todo, Note, See Also, Warning etc..."
--     .. "Provide clear description while informative."
--     .. "DO NOT CHANGE ANY CODE BESIDE DOCSTRING. USE TABS INSTEAD OF SPACE FOR INDENTATION."
--     .. "DO NOT MAKE UP THINGS UP. USE FACT ONLY THAT YOU ARE VERY CONFIDENT."
--     .. "<CR>"
--
-- -- require("sg.cody.commands").do_task(bufnr, start_line - 1, end_line, msg)
--   vim.api.nvim_command('CodyTask '
--     .. msg)
-- end

local msg = "Add Docstring and arguments types hints and return types hints to the whole code."
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

map("v", "<leader>Cd",":CodyTask "..msg.."<CR>", "[C]ody [d]ocumentation")

-- local msg = "Add Docstring to all methods following google norm. "
--   .. "Also add type hints in the arguments and in the docstring arguments in parethentis. "
--   .. "Do not remove comments"
