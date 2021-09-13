local wk = require('which-key')

-- Use 'jk' instead of ESC in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<esc>', {noremap = true})

wk.register({
    f = {
        name = 'Files',
        t = {'<cmd>NvimTreeToggle<cr>', 'FileTree toggle'},
        f = {'<cmd>NvimTreeFocus<cr>', 'FileTree focus'},
        s = {'<cmd>w<cr>', 'Save current file'},
        S = {'<cmd>wall<cr>', 'Save all open files'},
        C = {
            name = 'Convert',
            d = {'<cmd>update | e ++ff=dos | w<cr>', 'Unix2Dos'},
            u = {'<cmd>update | e ++ff=dos | setlocal ff=unix | w<cr>', 'Dos2Unix'}
        }
    },
    b = {
        name = 'Buffers',
        h = {'<cmd>bprev<cr>', 'Previous buffer'},
        j = {'<cmd>blast<cr>', 'Last buffer'},
        k = {'<cmd>bfirst<cr>', 'First buffer'},
        l = {'<cmd>bnext<cr>', 'Next buffer'},
        s = {'<cmd>Startify<cr>', 'Open Welcome screen'},
        t = {'<cmd>NvimTreeFindFile<cr>', 'FileTree at buffer dir'},
        n = {
            name = 'New',
            h = {'<cmd>topleft vertical new<cr>', 'Buffer to left'},
            j = {'<cmd>rightbelow new<cr>', 'Buffer below'},
            k = {'<cmd>new<cr>', 'Buffer above'},
            l = {'<cmd>rightbelow vertical new<cr>', 'Buffer to right'},
            n = {'<cmd>enew<cr>', 'Empty buffer'}
        },
        p = {'<cmd>normal! ggdG"+P<cr>', 'Paste Clipboard to whole buffer'},
        y = {'<cmd>normal! ggVG"+y``<cr>', 'Copy whole buffer to Clipboard'}
    },
    j = {
        name = 'Jump',
        f = {'<cmd>m`^<cr>', 'Beginning of line'},
        j = {'<cmd>m`g_<cr>', 'End of line'}
    },
    w = {
        name = 'Windows',
        h = {'<cmd>wincmd h<cr>', 'Go left'},
        j = {'<cmd>wincmd j<cr>', 'Go down'},
        k = {'<cmd>wincmd k<cr>', 'Go up'},
        l = {'<cmd>wincmd l<cr>', 'Go right'},
        p = {'<cmd>wincmd p<cr>', 'Go previous'}
    },
    p = {
        name = 'Project'
    }
}, {prefix = '<leader>'})
