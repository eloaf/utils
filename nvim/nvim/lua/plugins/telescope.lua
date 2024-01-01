return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                              , branch = '0.1.x',
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
            -- 
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
    },
    config = function()
        print("NIG")
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string( { search = vim.fn.input("Grep > ") } );
        end)
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})

        -- You dont need to set any of these options. These are the default ones. Only
        -- the loading is important
        require('telescope').setup {
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
        -- require('telescope').load_extension('fzf')
    end
}
