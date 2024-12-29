return {
	load = function()
		-- check if colorscheme already loaded
		if vim.g.colors_name then
			vim.cmd([[hi clear]])
		end

		-- set some variables
		vim.g.colors_name = 'gh'
		vim.o.background = 'dark'
		vim.o.termguicolors = true

		-- load terminal colors, TODO: fix order of colors + add others
		local colors = require('gh.colors')

		for index, color in ipairs(colors) do
			vim.g['terminal_color_' .. (index - 1)] = color
		end

		-- load colors
		local groups = require('gh.groups')

		for group, config in pairs(groups) do
			vim.api.nvim_set_hl(0, group, config)
		end
	end
}

