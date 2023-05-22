-- All the remap I can do
-- TODO: Figure out how to add the one that are part of plugins
-- Change mapleader
vim.g.mapleader=","
vim.g.wordmotion_prefix = '<leader>'
local function map(mode,keys,action,description)
  local options =  { noremap=true, silent = true, desc=description}
  vim.keymap.set(mode,keys,action,options)
end

map("n","<leader>st",function() MiniTrailspace.trim() end,"[S][t]rip Whitespace")
-- Copy paste binding
map("x", "<leader>pp", [["_dP]],'Past Previous copied selection')
map({"x","n","v"}, "<leader>pc", '"+p','Past Clipboard (CTR+V) after')
map({"x","n","v"}, "<leader>pC", '"+P','Past Clipboard (CTR+V) before')
map({"n", "v"}, "<leader>y", [["+y]],'Copy to Clipboard (CTR+C)' )
map("n", "<leader>Y", [["+Y]],'Copy to Clipboard (CTR+C) whole line')
map({"n", "v"}, "<leader>d", [["_d]],'Delete to Buffer ?')
map("n", "<leader>t", ':NeoTreeFocusToggle<cr>','Open Explorer Tree')
map("n", "<leader>n", 'o-<space><space><ESC>"=strftime("%m/%d/%y")<CR>P i:<space>','Add Bragg entry')
map('n', '<leader>it', '<cmd>IronRepl<cr>','[I]ron [T]oggle')
map('n', '<leader>ir', '<cmd>IronRestart<cr>','[I]ron [R]estart')
map('n', '<leader>if', '<cmd>IronFocus<cr>','[I]ron [F]ocus')
map('n', '<leader>ih', '<cmd>IronHide<cr>','[I]ron [H]ide')
map("n", "<leader>zn", ":TZNarrow<CR>", '[Z]en [N]arrow')
map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", '[Z]en [N]arrow')
map("n", "<leader>zf", ":TZFocus<CR>", '[Z]en [F]ocus toggle')
map("n", "<leader>zm", ":TZMinimalist<CR>", '[Z]en [M]inimalist')
map("n", "<leader>za", ":TZAtaraxis<CR>", '[Z]en [A]tarix')
map("n", "<C-w>m", ":TZFocus<CR>", 'Maximize window')
