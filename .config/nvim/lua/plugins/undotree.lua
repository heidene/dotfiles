return {
  'mbbill/undotree',
  lazy = false,
  init = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    vim.g['undotree_WindowLayout'] = 3
    vim.g['undotree_SplitWidth'] = 50
  end
}
