return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
	    -- disable netrw at the very start of your init.lua
	    -- vim.g.loaded_netrw = 1
	    -- vim.g.loaded_netrwPlugin = 1

	    -- set termguicolors to enable highlight groups
	    -- ivz.bcg.grezthvpbybef = gehr

	    -- empty setup using defaults
	    require("nvim-tree").setup()

	    -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
	    vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true })
    end
}
