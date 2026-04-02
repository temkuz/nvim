local function toggle_netrw()
    if vim.bo.filetype == "netrw" then
        vim.cmd("Rexplore")
    else
        vim.cmd("Explore")
    end
end

vim.keymap.set('n', '<leader>e', toggle_netrw, {noremap=true,silent=true})

