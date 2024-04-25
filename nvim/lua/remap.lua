local current_file = vim.fn.expand("%");
local file_extension = vim.fn.expand("%:e");
local config_path = vim.fn.stdpath('config')

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- Debugger
local dap = require("dap")

vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>ds", dap.step_into)
vim.keymap.set("n", "<leader>dS", dap.step_over)
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint)

-- Set up a key mapping that calls the showMenu function
vim.api.nvim_set_keymap('n', '<leader>m', [[:lua require('remap').showMenu()<CR>]], { noremap = true, silent = true })

-- Define the function that shows the menu
function showMenu()
   local choices = {'1: gcc', '2: g++', '3: make', '4: python'}
   local choice = vim.fn.inputlist(choices)

   if choice > 0 then
      if choice == 1 then
         vim.keymap.set("n", "<leader>g", [[:w<CR>:split<CR>:wincmd l<CR>:execute 'lcd ' . expand('%:p:h')<CR>:terminal gcc % -o %:r && ./%:r<CR>]], { noremap = true, silent = true })
      end
      if choice == 2 then
         vim.keymap.set("n", "<leader>g", [[:w<CR>:split<CR>:wincmd l<CR>:execute 'lcd ' . expand('%:p:h')<CR>:terminal g++ % -o %:r && ./%:r<CR>]], { noremap = true, silent = true })
      end
      if choice == 3 then
         vim.keymap.set("n", "<leader>g", [[:w<CR>:split<CR>:wincmd l<CR>:execute 'lcd ' . expand('%:p:h')<CR>:terminal make % -o %:r && ./%:r<CR>]], { noremap = true, silent = true })
      end
      if choice == 4 then
         vim.keymap.set("n", "<leader>g", [[:w<CR>:split<CR>:wincmd l<CR>:execute 'lcd ' . expand('%:p:h')<CR>:terminal python %<CR>]], { noremap = true, silent = true })
      end
   else
      print("Menu canceled")
   end
end

-- Export the showMenu function to be accessible from the key mapping
return {
   showMenu = showMenu
}

