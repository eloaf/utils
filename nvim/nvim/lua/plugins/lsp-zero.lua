return {
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            -- here you can setup the language servers
            require('mason').setup({})
            require('mason-lspconfig').setup({
                -- Replace the language servers listed here 
                -- with the ones you want to install
                ensure_installed = {'pyright'},
                handlers = {
                    lsp_zero.default_setup,
                },
            })

            -- Python
            require('lspconfig').pyright.setup{}

            -- Lua
            require('lspconfig').lua_ls.setup {
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                            Lua = {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT'
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                        -- "${3rd}/luv/library"
                                        -- "${3rd}/busted/library",
                                    }
                                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                    -- library = vim.api.nvim_get_runtime_file("", true)
                                }
                            }
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end
                    return true
                end
            }

            cfg = {
                debug = false, -- set to true to enable debug logging
                log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
                -- default is  ~/.cache/nvim/lsp_signature.log
                verbose = false, -- show debug line number

                bind = true, -- This is mandatory, otherwise border config won't get registered.
                -- If you want to hook lspsaga or other signature handler, pls set to false
                doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                -- set to 0 if you DO NOT want any API comments be shown
                -- This setting only take effect in insert mode, it does not affect signature help in normal
                -- mode, 10 by default

                max_height = 12, -- max height of signature floating_window
                max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
                -- the value need >= 40
                wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
                floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

                floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
                -- will set to true when fully tested, set to false will use whichever side has more space
                -- this setting will be helpful if you do not want the PUM and floating win overlap

                floating_window_off_x = 1, -- adjust float windows x position.
                -- can be either a number or function
                floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
                -- can be either number or function, see examples

                close_timeout = 4000, -- close floating window after ms when laster parameter is entered
                fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
                hint_enable = true, -- virtual hint enable
                -- hint_prefix = "🐼 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
                hint_prefix = "??? ",
                hint_scheme = "String",
                hint_inline = function() return false end,  -- should the hint be inline(nvim 0.10 only)?  default false
                -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
                -- return 'right_align' to display hint right aligned in the current line
                hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
                handler_opts = {
                    border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
                },

                always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

                auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
                extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
                zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

                padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

                transparency = nil, -- disabled by default, allow floating win transparent value 1~100
                shadow_blend = 36, -- if you using shadow as border use this set the opacity
                shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
                timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
                toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
                toggle_key_flip_floatwin_setting = false, -- true: toggle floating_windows: true|false setting after toggle key pressed
                -- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
                -- may not popup when typing depends on floating_window setting

                select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
                move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
            }

            -- recommended:
            require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

            -- You can also do this inside lsp on_attach
            -- note: on_attach deprecated
            require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key


            -- TODO some ideas: go to definition in another window, or in a split
        end
    }
}