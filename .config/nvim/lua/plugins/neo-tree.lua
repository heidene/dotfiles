return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-b>", "<Cmd>Neotree toggle position=right<CR>")
		vim.keymap.set("n", "<leader>b", "<Cmd>Neotree reveal<CR>")
		vim.keymap.set("n", "<leader>g", "<Cmd>Neotree float git_status<CR>")

		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = true,
					hide_hidden = true,
					hide_gitignored = true,
					always_show = { -- remains visible even if other settings would normally hide it
						".vscode",
						".jenkinsfiles",
					},
					never_show = {
						".git",
						".github",
					},
				},
        follow_current_file = {
          enabled = false, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = true,
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
					end,
				},
				{
					event = "neo_tree_buffer_enter",
					handler = function(arg)
						vim.cmd([[
                  setlocal relativenumber
                ]])
					end,
				},
			},
		})
	end,
}
