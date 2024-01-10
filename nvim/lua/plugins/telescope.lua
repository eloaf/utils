return {
    -- 'nvim-telescope/telescope.nvim', tag = '0.1.5',
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            -- requires make and gcc; `brew install make gcc`
            -- fzf-native is a c port of fzf. It only covers the algorithm and implements few functions to support calculating the score.
            -- 
            -- This means that the fzf syntax is supported:
            -- 
            -- Token	Match type			Description
            -- sbtrkt	fuzzy-match			Items that match sbtrkt
            -- 'wild	exact-match (quoted)		Items that include wild
            -- ^music	prefix-exact-match		Items that start with music
            -- .mp3$	suffix-exact-match		Items that end with .mp3
            -- !fire	inverse-exact-match		Items that do not include fire
            -- !^music	inverse-prefix-exact-match	Items that do not start with music
            -- !.mp3$	inverse-suffix-exact-match	Items that do not end with .mp3
            -- A single bar character term acts as an OR operator. For example, the following query matches entries that start with core and end with either go, rb, or py.
            -- 
            -- ^core go$ | rb$ | py$
            -- This is an advantage over the more simpler fzy algorithm, which is also available for telescope (as native component or as lua component).
            'nvim-telescope/telescope-fzf-native.nvim',
            -- https://stackoverflow.com/a/77442531/3033686
            -- Navigating to /Users/eric/.local/share/nvim/lazy/telescope-fzf-native.nvim and running make fixed the issue for me.
            build = 'make',
            -- lazy = true,
        },
    },
    config = function()

        local telescope = require('telescope')
        local actions = require("telescope.actions")

        -- Default mappings, To see the full list of mappings, check out lua/telescope/mappings.lua and the default_mappings table.
        -- Mappings         Action
        -- <C-n>/<Down>	    Next item
        -- <C-p>/<Up>	    Previous item
        -- j/k	            Next/previous (in normal mode)
        -- H/M/L	        Select High/Middle/Low (in normal mode)
        -- gg/G	            Select the first/last item (in normal mode)
        -- <CR>	            Confirm selection
        -- <C-x>	        Go to file selection as a split
        -- <C-v>	        Go to file selection as a vsplit
        -- <C-t>	        Go to a file in a new tab
        -- <C-u>	        Scroll up in preview window
        -- <C-d>	        Scroll down in preview window
        -- <C-f>	        Scroll left in preview window
        -- <C-k>	        Scroll right in preview window
        -- <M-f>	        Scroll left in results window
        -- <M-k>	        Scroll right in results window
        -- <C-/>	        Show mappings for picker actions (insert mode)
        -- ?	            Show mappings for picker actions (normal mode)
        -- <C-c>	        Close telescope (insert mode)
        -- <Esc>	        Close telescope (in normal mode)
        -- <Tab>	        Toggle selection and move to next selection
        -- <S-Tab>	        Toggle selection and move to prev selection
        -- <C-q>	        Send all items not filtered to quickfixlist (qflist)
        -- <M-q>	        Send all selected items to qflist

        -- You dont need to set any of these options. These are the default ones. Only
        -- the loading is important
        telescope.setup {
            defaults = {
                mappings = {
                    -- https://www.reddit.com/r/neovim/comments/pzxw8h/telescope_quit_on_first_single_esc/
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            }
        }
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        telescope.load_extension('fzf')

        local builtin = require("telescope.builtin")

        -- https://github.com/nvim-telescope/telescope.nvim/blob/master/README.md#pickers
        -- File Pickers
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fs", builtin.grep_string)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)
        vim.keymap.set("n", "<leader>fgg", builtin.git_files)  -- rename to gf ? and comment to cc?
        -- Vim pickers
        vim.keymap.set("n", "<leader>fb", builtin.buffers)
        vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
        vim.keymap.set("n", "<leader>fc", builtin.commands)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags)

        -- vim.keymap.set("n", "<leader>fs", function()
        --     builtin.grep_string( { search = vim.fn.input("Grep > ") } );
        -- end)
        -- builtin.live_grep({
        --     prompt_title = "Live Grep",
        --     -- cwd = "~/dev/telescope.nvim",
        -- })

        -- vim.keymap.set("n", "<leader>fg", function()
        --     -- Prepend "class " to the search term and then call grep_string
        --     -- builtin.grep_string( { search = "class " .. vim.fn.input("find class > ") } );
        --     builtin.live_grep({})
        --     -- builtin.grep_string( { search = "class " .. vim.fn.input("find class > ") } );
        -- end)

        -- vim.keymap.set("n", "<leader>pc", function()
        --     -- Prepend "class " to the search term and then call grep_string
        --     builtin.grep_string( { search = "class " .. vim.fn.input("find class > ") } );
        -- end)

        -- vim keymap.set("n", "<leader>pc", function()
        --     builtin.find_files
        -- end)

        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    end
}
