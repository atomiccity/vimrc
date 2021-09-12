local ascii_art_header = {
    '                                        ▟▙            ',
    '                                        ▝▘            ',
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
