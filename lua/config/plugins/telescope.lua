return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'}
        },
        config = function()
            print("Telescope config loaded")
            vim.keymap.set("n", "<space>tff", require('telescope.builtin').find_files)
            -- vim.keymap.set("n", "<space>tlg", require('telescope.builtin').live_grep(require('telescope.themes').get_ivy))
            vim.keymap.set("n", "<space>tlg", function() 
                local opts = require('telescope.themes').get_ivy({})
                require('telescope.builtin').live_grep(opts)
            end)
        end
    }
}

