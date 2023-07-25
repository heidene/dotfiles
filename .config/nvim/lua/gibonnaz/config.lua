vim.cmd.colorscheme "catppuccin-macchiato"

--[[ local function update_hl(group, tbl)
	local old_hl = vim.api.nvim_get_hl_by_name(group, true)
	local new_hl = vim.tbl_extend('force', old_hl, tbl)
	vim.api.nvim_set_hl(0, group, new_hl)
end

update_hl('TSKeyword', { italic = true }) ]]

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#B7BDF8' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#C6A0F6' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#B7BDF8' })

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Visual", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NeoTree", { bg = "none" })
