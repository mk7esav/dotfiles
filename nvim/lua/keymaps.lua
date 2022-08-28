function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q!<CR>')
map('n', '<leader>s', ':so %<CR>')
map('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')
map('n', '<leader>sv', ':w<CR>:so %<CR>:q<CR>')
map('n', '<leader>f', ':Telescope find_files<CR>')
map('n', '<leader>g', ':Telescope live_grep<CR>')
