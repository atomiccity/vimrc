local ascii_art_header = {
    '                                                  ▟▙            ',
    '                                                  ▝▘            ',
    '          ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
    '          ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
    '          ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
    '          ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
    '          ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
    '',
    '     Vim Tip:',
    ''
}

-- Array to hold Vim tips
local vim_tips = {}

-- Initialize random number algorithm to get random tips
math.randomseed(os.time())

-- Read Vim tips into array above
for line in io.lines(vim.fn.stdpath('config')..'/vimtips.txt') do
    table.insert(vim_tips, line)
end

-- Helper function to get random quote (Vim tip, in this case)
local function get_random_quote()
    return vim_tips[math.random(#vim_tips)]
end

-- Modify header to contain random tip
function randomize_header()
    quote_row = table.getn(ascii_art_header)
    ascii_art_header[quote_row] = '          '..get_random_quote()
    vim.api.nvim_set_var('startify_custom_header', ascii_art_header)
end

-- Randomize the header each time a buffer is entered
vim.cmd([[
    augroup randomize_header_group
        autocmd!
        autocmd BufEnter <buffer> lua randomize_header()
    augroup end
]])

-- Config Startify
vim.g.startify_session_dir = vim.fn.stdpath('data')..'/session'
vim.g.startify_session_autoload = true
vim.g.startify_session_delete_buffers = true
vim.g.startify_session_persistence = true
vim.g.startify_change_to_vcs_root = true
vim.g.startify_fortune_use_unicode = true

vim.g.startify_lists = {
    { type = 'files',     header = {'    Files'} },
    { type = 'dir',       header = {'    Current Directory '..vim.fn.getcwd()} },
    { type = 'sessions',  header = {'    Sessions'} },
    { type = 'bookmarks', header = {'    Bookmarks'} }
}

vim.g.startify_bookmarks = {
    { p = '~/Projects' },
    { c = '/BrAutomation/.config/nvim' }
}
