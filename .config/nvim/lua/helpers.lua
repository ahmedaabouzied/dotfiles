local fold_indent = function (bufnr) 
    vim.cmd('set foldmethod=indent')
    vim.cmd('set fdo-=search')
end

vim.api.nvim_create_user_command(
    'FoldIndent',
    fold_indent,
    {bang = true}
    )

vim.cmd([[
command! LspFormat lua vim.lsp.buf.format()
]])


-- Optional: You can also define a keymapping here if you haven't already
-- vim.keymap.set('n', '<leader>lf', '<cmd>LspFormat<cr>', { desc = 'Format code' })
