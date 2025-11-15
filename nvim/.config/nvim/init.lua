-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the termina
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
-- Make line numbers default
vim.o.number = true
vim.o.ruler = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.o.clipboard = 'unnamedplus'
-- end)
-- Enable break indent
vim.o.breakindent = true

-- Set W to stop_after_first
-- vim.cmd()

-- Save undo history
vim.o.undofile = true
vim.keymap.set('n', '<leader>u', ':Atone toggle<CR>', { desc = 'Toggle undotree', noremap = true, silent = true })

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
-- vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 15

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Yanks configuratins
vim.keymap.set('n', 'Y', '"+y')
vim.keymap.set('v', 'Y', '"+y')
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   callback = function()
--     vim.fn.setreg('+', vim.fn.getreg '"') -- salin isi register default (") ke clipboard ("+)
--   end,
-- })

-- Save Configuration
vim.api.nvim_create_user_command('W', 'w', {})

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float, { desc = 'Show error' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({

    {
        'lewis6991/gitsigns.nvim',
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gitsigns.nav_hunk('next')
                    end
                end, { desc = 'Jump to next git [c]hange' })

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[c', bang = true })
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end, { desc = 'Jump to previous git [c]hange' })

                -- Actions
                -- visual mode
                map('v', '<leader>hs', function()
                    gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'git [s]tage hunk' })
                map('v', '<leader>hr', function()
                    gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'git [r]eset hunk' })
                -- normal mode
                map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
                map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
                map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
                map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
                map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
                map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
                map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
                map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
                map('n', '<leader>hD', function()
                    gitsigns.diffthis('@')
                end, { desc = 'git [D]iff against last commit' })
                -- Toggles
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
                map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
            end,
        },
    },

    { -- useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        opts = {
            preset = 'helix',
            -- delay between pressing a key and opening which-key (milliseconds)
            -- this setting is independent of vim.o.timeoutlen
            delay = 250,
            icons = {
                -- set icon mappings to true if you have a nerd font
                mappings = vim.g.have_nerd_font,
                -- if you are using a nerd font: set icons.keys to an empty table which will use the
                -- default which-key.nvim defined nerd font icons, otherwise define a string table
                keys = vim.g.have_nerd_font and {} or {
                    up = '<up> ',
                    down = '<down> ',
                    left = '<left> ',
                    right = '<right> ',
                    c = '<c-…> ',
                    m = '<m-…> ',
                    d = '<d-…> ',
                    s = '<s-…> ',
                    cr = '<cr> ',
                    esc = '<esc> ',
                    scrollwheeldown = '<scrollwheeldown> ',
                    scrollwheelup = '<scrollwheelup> ',
                    nl = '<nl> ',
                    bs = '<bs> ',
                    space = '<space> ',
                    tab = '<tab> ',
                    f1 = '<f1>',
                    f2 = '<f2>',
                    f3 = '<f3>',
                    f4 = '<f4>',
                    f5 = '<f5>',
                    f6 = '<f6>',
                    f7 = '<f7>',
                    f8 = '<f8>',
                    f9 = '<f9>',
                    f10 = '<f10>',
                    f11 = '<f11>',
                    f12 = '<f12>',
                },
            },

            -- document existing key chains
            spec = {
                { '<leader>e', group = '[e]xplore' },
                { '<leader>s', group = '[s]earch' },
                { '<leader>t', group = '[t]oggle' },
                { '<leader>h', group = 'git [h]unk', mode = { 'n', 'v' } },
            },
        },
    },

    -- note: plugins can specify dependencies.
    --
    -- the dependencies are proper plugin specifications as well - anything
    -- you do for a plugin at the top level, you can do for a dependency.
    --
    -- use the `dependencies` key to specify the dependencies of a particular plugin

    { -- fuzzy finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { -- if encountering errors, see telescope-fzf-native readme for installation instructions
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- this is only run then, not every time neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable('make') == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },

            -- useful for getting pretty icons, but requires a nerd font.
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        },
        config = function()
            -- telescope is a fuzzy finder that comes with a lot of different things that
            -- it can fuzzy find! it's more than just a "file finder", it can search
            -- many different aspects of neovim, your workspace, lsp, and more!
            --
            -- the easiest way to use telescope, is to start by doing something like:
            --  :telescope help_tags
            --
            -- after running this command, a window will open up and you're able to
            -- type in the prompt window. you'll see a list of `help_tags` options and
            -- a corresponding preview of the help.
            --
            -- Two important keymaps to use while in Telescope are:
            --  - Insert mode: <c-/>
            --  - Normal mode: ?
            --
            -- This opens a window that shows you all of the keymaps for the current
            -- Telescope picker. This is really useful to discover what Telescope can
            -- do as well as how to actually do it!

            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            require('telescope').setup({
                -- You can put your default mappings / updates / etc. in here
                --  All the info you're looking for is in `:help telescope.setup()`
                defaults = {
                    file_ignore_patterns = { 'node_modules', '%.git/', 'dist', 'build' },
                    mappings = {
                        i = {
                            ['<C-d>'] = require('telescope.actions').delete_buffer,
                            ['<C-j>'] = require('telescope.actions').move_selection_previous,
                            ['<C-k>'] = require('telescope.actions').move_selection_next,
                        },
                        n = { ['<C-d>'] = require('telescope.actions').delete_buffer },
                    },
                },
                -- pickers = {}
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            })

            -- Enable Telescope extensions if they are installed
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

            -- See `:help telescope.builtin`
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
            vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
            vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch buffers' })
            vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find Buffer' })

            -- Telescope Color
            vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'Normal' })
            vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#555555', bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'TelescopeTitle', { fg = '#89b4fa' })

            -- Slightly advanced example of overriding default behavior and theme
            vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                    -- winblend = 10,
                    previewer = false,
                }))
            end, { desc = '[/] Fuzzily search in current buffer' })

            -- It's also possible to pass additional configuration options.
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set('n', '<leader>s/', function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                })
            end, { desc = '[S]earch [/] in Open Files' })

            -- Shortcut for searching your Neovim configuration files
            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files({ cwd = vim.fn.stdpath('config') })
            end, { desc = '[S]earch [N]eovim files' })
        end,
    },

    --new config
    {
        -- Main LSP Configuration
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', opts = {} },
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP.
            { 'j-hui/fidget.nvim', opts = {} },

            -- nvim-cmp for autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            -- Set up nvim-cmp
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            cmp.setup({
                -- Border for autocompletion
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                formatting = { format = require('tailwindcss-colorizer-cmp').formatter },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                }),
            })

            -- Set up lspconfig with nvim-cmp capabilities
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            opts = {
                servers = {
                    tailwindcss = {
                        -- exclude a filetype from the default_config
                        filetypes_exclude = { 'markdown' },
                        -- add additional filetypes to the default_config
                        filetypes_include = {},
                        -- to fully override the default_config, change the below
                        -- filetypes = {}
                    },
                },
                setup = {
                    tailwindcss = function(_, opts)
                        local tw = LazyVim.lsp.get_raw_config('tailwindcss')
                        opts.filetypes = opts.filetypes or {}

                        -- Add default filetypes
                        vim.list_extend(opts.filetypes, tw.default_config.filetypes)

                        -- Remove excluded filetypes
                        --- @param ft string
                        opts.filetypes = vim.tbl_filter(function(ft)
                            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
                        end, opts.filetypes)

                        -- Additional settings for Phoenix projects
                        opts.settings = {
                            tailwindCSS = {
                                includeLanguages = {
                                    elixir = 'html-eex',
                                    eelixir = 'html-eex',
                                    heex = 'html-eex',
                                },
                            },
                        }

                        -- Add additional filetypes
                        vim.list_extend(opts.filetypes, opts.filetypes_include or {})
                    end,
                },
            }
            -- Enable the following language servers
            local servers = {
                tsserver = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = 'Replace',
                            },
                        },
                    },
                },
                gopls = {
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                                shadow = true,
                            },
                            staticcheck = true,
                            gofumpt = true,
                            hints = {
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                constantValues = true,
                                functionTypeParameters = true,
                                parameterNames = true,
                                rangeVariableTypes = true,
                            },
                        },
                    },
                },
            }
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
                callback = function()
                    vim.opt_local.tabstop = 2
                    vim.opt_local.shiftwidth = 2
                    vim.opt_local.expandtab = true
                end,
            })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'go',
                callback = function()
                    vim.opt_local.tabstop = 4 -- atau 8 kalau mau default go
                    vim.opt_local.shiftwidth = 4
                    vim.opt_local.expandtab = false -- default-nya pakai tab
                end,
            })

            -- Ensure the servers and tools above are installed
            local ensure_installed = {
                'typescript-language-server', -- Correct package name for tsserver
                'tailwindcss-language-server',
                'lua-language-server',
                'stylua',
                'eslint_d',
                'prettier',
                -- Go tools
                'gopls', -- Go language server
                'delve', -- Go debugger
                'goimports', -- Go imports management
                'gofumpt', -- Go formatter
                'golines', -- Go code line formatter
                'gomodifytags', -- Go struct tag manipulation
                'impl', -- Go interface implementation
                'staticcheck', -- Go static analysis
            }
            require('mason-tool-installer').setup({
                ensure_installed = ensure_installed,
                auto_update = true,
            })

            require('mason-lspconfig').setup({
                ensure_installed = {
                    -- 'tsserver',
                    'lua_ls',
                    'gopls',
                }, -- LSP server names (not package names)
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            })
        end,
    },

    { -- Autoformat
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            {
                '<leader>f',
                function()
                    require('conform').format({ async = true, lsp_format = 'fallback' })
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    return nil
                else
                    return {
                        timeout_ms = 500,
                        lsp_format = 'fallback',
                    }
                end
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                css = { 'prettier' },
                json = { 'prettier' },
                javascript = { 'prettier' },
                jsonc = { 'prettier' },
                yaml = { 'prettier' },
                typescriptreact = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        },
    },
    --
    -- { -- Autocompletion
    --   'saghen/blink.cmp',
    --   event = 'VimEnter',
    --   version = '1.*',
    --   dependencies = {
    --     -- Snippet Engine
    --     {
    --       'L3MON4D3/LuaSnip',
    --       version = '2.*',
    --       build = (function()
    --         -- Build Step is needed for regex support in snippets.
    --         -- This step is not supported in many windows environments.
    --         -- Remove the below condition to re-enable on windows.
    --         if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
    --           return
    --         end
    --         return 'make install_jsregexp'
    --       end)(),
    --       dependencies = {
    --         -- `friendly-snippets` contains a variety of premade snippets.
    --         --    See the README about individual language/framework/plugin snippets:
    --         --    https://github.com/rafamadriz/friendly-snippets
    --         -- {
    --         --   'rafamadriz/friendly-snippets',
    --         --   config = function()
    --         --     require('luasnip.loaders.from_vscode').lazy_load()
    --         --   end,
    --         -- },
    --       },
    --       opts = {},
    --     },
    --     'folke/lazydev.nvim',
    --   },
    --   --- @module 'blink.cmp'
    --   --- @type blink.cmp.Config
    --   opts = {
    --     keymap = {
    --       -- 'default' (recommended) for mappings similar to built-in completions
    --       --   <c-y> to accept ([y]es) the completion.
    --       --    This will auto-import if your LSP supports it.
    --       --    This will expand snippets if the LSP sent a snippet.
    --       -- 'super-tab' for tab to accept
    --       -- 'enter' for enter to accept
    --       -- 'none' for no mappings
    --       --
    --       -- For an understanding of why the 'default' preset is recommended,
    --       -- you will need to read `:help ins-completion`
    --       --
    --       -- No, but seriously. Please read `:help ins-completion`, it is really good!
    --       --
    --       -- All presets have the following mappings:
    --       -- <tab>/<s-tab>: move to right/left of your snippet expansion
    --       -- <c-space>: Open menu or open docs if already open
    --       -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
    --       -- <c-e>: Hide menu
    --       -- <c-k>: Toggle signature help
    --       --
    --       -- See :h blink-cmp-config-keymap for defining your own keymap
    --       preset = 'default',
    --
    --       -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --       --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    --     },
    --
    --     appearance = {
    --       -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    --       -- Adjusts spacing to ensure icons are aligned
    --       nerd_font_variant = 'mono',
    --     },
    --
    --     completion = {
    --       -- By default, you may press `<c-space>` to show the documentation.
    --       -- Optionally, set `auto_show = true` to show the documentation after a delay.
    --       documentation = { auto_show = false, auto_show_delay_ms = 500 },
    --     },
    --
    --     sources = {
    --       default = { 'lsp', 'path', 'snippets', 'lazydev' },
    --       providers = {
    --         lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    --       },
    --     },
    --
    --     snippets = { preset = 'luasnip' },
    --
    --     -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    --     -- which automatically downloads a prebuilt binary when enabled.
    --     --
    --     -- By default, we use the Lua implementation instead, but you may enable
    --     -- the rust implementation via `'prefer_rust_with_warning'`
    --     --
    --     -- See :h blink-cmp-config-fuzzy for more information
    --     fuzzy = { implementation = 'lua' },
    --
    --     -- Shows a signature help window while you type arguments for a function
    --     signature = { enabled = true },
    --   },
    -- },

    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },

    { -- Collection of various small independent plugins/modules
        'echasnovski/mini.nvim',
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()

            -- Simple and easy statusline.
            --  You could remove this setup call if you don't like it,
            --  and try some other statusline plugin
            -- local statusline = require('mini.statusline')
            -- set use_icons to true if you have a Nerd Font
            -- statusline.setup({ use_icons = vim.g.have_nerd_font })

            -- You can configure sections in the statusline by overriding their
            -- default behavior. For example, here we set the section for
            -- cursor location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            -- statusline.section_location = function()
            -- return '%l/%L'
            -- end

            -- statusline.section_filename = function()
            --     local filename = vim.fn.expand('%:t')
            --     if filename == '' then
            --         filename = '[No Name]'
            --     end
            --     vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { fg = '#ffffff', bg = '#282c34', bold = false })
            --
            --     local modified = vim.bo.modified and ' ●' or ''
            --     local readonly = vim.bo.readonly and ' 🔒' or ''
            --     return filename .. modified .. readonly
            -- end

            -- ... and there is more!
            --  Check out: https://github.com/echasnovski/mini.nvim
        end,
    },
    -- import additional plugins
    { import = 'plugins' },
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
