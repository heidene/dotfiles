require('neo-tree').setup({
    filesystem = {
        filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_hidden = true,
            hide_gitignored = true,
            always_show = { -- remains visible even if other settings would normally hide it
                ".vscode",
                ".jenkinsfiles"
            },
        },
        never_show = {
            ".git",
            ".github"
        },
    },
    window = {
        position = "float",
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                --auto close
                require("neo-tree").close_all()
            end
        },
    }
})


vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle position=right<CR>')
vim.keymap.set('n', '<leader>b', '<Cmd>Neotree float<CR>')
vim.keymap.set('n', '<leader>g', '<Cmd>Neotree float git_status<CR>')
