return {
	-- Tokoynight colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
		},
	},
	-- Pywal
	{ "AlphaTechnolog/pywal.nvim" },
	-- Indentation Guide Lines
	{
		"nvim-mini/mini.indentscope",
		version = "*",
		opts = {
			symbol = "┃",
			options = {
				try_as_border = true,
			},
		},
	},
	-- Better Comments (Make comments better)
	{
		"Djancyp/better-comments.nvim",
		config = function()
			require("better-comment").Setup()
		end,
	},
	-- Render markdown directly in neovim
	{
		"MeanderingProgrammer/render-markdown.nvim",
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	-- Icons for neovim
	{ "nvim-tree/nvim-web-devicons" },
	-- Which key helps for keybinds in neovim
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	-- LuaLine (Better Status Line)
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
		},
	},
	-- Colorizer render colors in neovim
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- nvim-tree to explore files
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			filters = {
				dotfiles = true,
			},
			view = {
				width = 25,
				side = "left",
				number = false,
			},
		},
	},
}
