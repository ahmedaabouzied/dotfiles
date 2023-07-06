local fold_indent = function (bufnr) 
    vim.cmd('set foldmethod=indent')
    vim.cmd('set fdo-=search')
end

vim.api.nvim_create_user_command(
    'FoldIndent',
    fold_indent,
    {bang = true}
    )
