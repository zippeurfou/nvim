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
map({ "n", "v" }, "<leader>d", [["_d]], 'Delete to Buffer ?')
map("n", "<leader>t", ':NeoTreeFocusToggle<cr>', 'Open Explorer Tree')
map("n", "<leader>n", 'o-<space><space><ESC>"=strftime("%m/%d/%y")<CR>P i:<space>', 'Add Bragg entry')
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
map("n", "<leader>Dr",function() require("dapui").toggle({layout=2, reset=true}) end, "[R]epl toggle")
map("n", "<leader>DR", function() require("dap").restart_frame() end, "[R]estart dap")
map("n", "<leader>DC", function() require("dap").run_to_cursor() end, "Run To [C]ursor")
map("n", "<leader>Dl", "<cmd>lua require'dap'.run_last()<cr>", "[L]ast")
map("n", "<leader>Du", "<cmd>lua require'dapui'.toggle()<cr>", "[U]I")
map("n", "<leader>Dt", "<cmd> lua require'neotest'.output_panel.toggle()<cr>", "[T]erminal")
map("n", "<leader>DT", function() require("dapui").toggle({layout=3, reset=true}) end, "[T]erminal dap")
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
