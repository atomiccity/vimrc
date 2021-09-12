local wk = require('which-key')

wk.register({
	f = {
		name = 'file',
		t = {'<cmd>NvimTreeToggle<cr>', 'FileTree Toggle'},
		f = {'<cmd>NvimTreeFocus<cr>', 'FileTree Focus'}
	}
}, {prefix = '<leader>'})
