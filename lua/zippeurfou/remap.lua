-- All the remap I can do
-- TODO: Figure out how to add the one that are part of plugins
-- Change mapleader
vim.g.mapleader=","
vim.g.wordmotion_prefix = '<leader>'
local function map(mode,keys,action,description)
  local options =  { noremap=true, silent = true, desc=description}
  vim.keymap.set(mode,keys,action,options)
end

map("n","<leader>ss",function() MiniTrailspace.trim() end,"Strip Whitespace")
-- Copy paste binding
map("x", "<leader>pp", [["_dP]],'Past Previous copied selection')
map({"x","n","v"}, "<leader>pc", '"+p','Past Clipboard (CTR+V) after')
map({"x","n","v"}, "<leader>pC", '"+P','Past Clipboard (CTR+V) before')
map({"n", "v"}, "<leader>y", [["+y]],'Copy to Clipboard (CTR+C)' )
map("n", "<leader>Y", [["+Y]],'Copy to Clipboard (CTR+C) whole line')
map({"n", "v"}, "<leader>d", [["_d]],'Delete to Buffer ?')
map("n", "<leader>t", ':NeoTreeFocusToggle<cr>','Open Explorer Tree')
