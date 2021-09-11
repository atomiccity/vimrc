vim.opt.termguicolors = true
require('bufferline').setup {
	options = {
		numbers = 'buffer_id',
		show_buffer_icons = true,
		show_tab_indicators = true,
		seperator_style = 'padded_slant',
	}
}