require('tabline').setup {
    options = {
        always_show_tabs = true,
        tabline_show_bufnr = true
    }
}

vim.cmd[[
    set guioptions-=e " Use showtabline in gui vim
    set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]