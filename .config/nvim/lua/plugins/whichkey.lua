return {
	{
		"folke/which-key.nvim",
		lazy = false,
		config = {},
		init = function()
			vim.opt.timeoutlen = 200
		end,
		keys = {
			{ "<C-\\>",     "<cmd>!terminator<CR>",                     "n", {} },

			-- Move to window using the <ctrl> hjkl keys
			{ "<C-h>",      "<C-w>h",                                   "n", { desc = "Go to Left Window", remap = true } },
			{ "<C-j>",      "<C-w>j",                                   "n", { desc = "Go to Lower Window", remap = true } },
			{ "<C-k>",      "<C-w>k",                                   "n", { desc = "Go to Upper Window", remap = true } },
			{ "<C-l>",      "<C-w>l",                                   "n", { desc = "Go to Right Window", remap = true } },

			-- Resize window using <ctrl> arrow keys
			{ "<C-Up>",     "<cmd>resize +2<cr>",                       "n", { desc = "Increase Window Height" } },
			{ "<C-Down>",   "<cmd>resize -2<cr>",                       "n", { desc = "Decrease Window Height" } },
			{ "<C-Left>",   "<cmd>vertical resize -2<cr>",              "n", { desc = "Decrease Window Width" } },
			{ "<C-Right>",  "<cmd>vertical resize +2<cr>",              "n", { desc = "Increase Window Width" } },

			-- Move Lines
			{ "<A-j>",      "<cmd>m .+1<cr>==",                         "n", { desc = "Move Down" } },
			{ "<A-k>",      "<cmd>m .-2<cr>==",                         "n", { desc = "Move Up" } },
			{ "<A-j>",      "<esc><cmd>m .+1<cr>==gi",                  "n", { desc = "Move Down" } },
			{ "<A-k>",      "<esc><cmd>m .-2<cr>==gi",                  "n", { desc = "Move Up" } },
			{ "<A-j>",      ":m '>+1<cr>gv=gv",                         "n", { desc = "Move Down" } },
			{ "<A-k>",      ":m '<-2<cr>gv=gv",                         "n", { desc = "Move Up" } },

			-- buffers
			{ "<S-h>",      "<cmd>bprevious<cr>",                       "n", { desc = "Prev Buffer" } },
			{ "<S-l>",      "<cmd>bnext<cr>",                           "n", { desc = "Next Buffer" } },
			{ "[b",         "<cmd>bprevious<cr>",                       "n", { desc = "Prev Buffer" } },
			{ "]b",         "<cmd>bnext<cr>",                           "n", { desc = "Next Buffer" } },
			{ "<leader>bb", "<cmd>e #<cr>",                             "n", { desc = "Switch to Other Buffer" } },
			{ "<leader>`",  "<cmd>e #<cr>",                             "n", { desc = "Switch to Other Buffer" } },
			-- {"<leader>bd", LazyVim.ui.bufremove, "n", { desc = "Delete Buffer" }},
			{ "<leader>bD", "<cmd>:bd<cr>",                             "n", { desc = "Delete Buffer and Window" } },

			-- commenting
			{ "gco",        "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", "n", { desc = "Add Comment Below" } },
			{ "gcO",        "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", "n", { desc = "Add Comment Above" } },

			-- lazy
			{ "<leader>l",  "<cmd>Lazy<cr>",                            "n", { desc = "Lazy" } },

			-- new file
			{ "<leader>fn", "<cmd>enew<cr>",                            "n", { desc = "New File" } },

			{ "<leader>xl", "<cmd>lopen<cr>",                           "n", { desc = "Location List" } },
			{ "<leader>xq", "<cmd>copen<cr>",                           "n", { desc = "Quickfix List" } },

			{ "[q",         vim.cmd.cprev,                              "n", { desc = "Previous Quickfix" } },
			{ "]q",         vim.cmd.cnext,                              "n", { desc = "Next Quickfix" } },

			-- diagnostic
			{ "<leader>cd", vim.diagnostic.open_float,                  "n", { desc = "Line Diagnostics" } },
			{ "]d",         vim.diagnostic.goto_next,                   "n", { desc = "Next Diagnostic" } },
			{ "[d",         vim.diagnostic.goto_prev,                   "n", { desc = "Prev Diagnostic" } },
			{ "]e", function()
				vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, "n", { desc = "Next Error" } },
			{ "[e", function()
				vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, "n", { desc = "Prev Error" } },
			{ "]w", function()
				vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
			end, "n", { desc = "Next Warning" } },
			{ "[w", function()
				vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
			end, "n", { desc = "Prev Warning" } },

			-- quit
			{ "<leader>qq",         "<cmd>qa<cr>",          "n", { desc = "Quit All" } },

			-- highlights under cursor
			{ "<leader>ui",         vim.show_pos,           "n", { desc = "Inspect Pos" } },
			{ "<leader>uI",         "<cmd>InspectTree<cr>", "n", { desc = "Inspect Tree" } },

			-- tabs
			{ "<leader><tab>l",     "<cmd>tablast<cr>",     "n", { desc = "Last Tab" } },
			{ "<leader><tab>o",     "<cmd>tabonly<cr>",     "n", { desc = "Close Other Tabs" } },
			{ "<leader><tab>f",     "<cmd>tabfirst<cr>",    "n", { desc = "First Tab" } },
			{ "<leader><tab><tab>", "<cmd>tabnew<cr>",      "n", { desc = "New Tab" } },
			{ "<leader><tab>]",     "<cmd>tabnext<cr>",     "n", { desc = "Next Tab" } },
			{ "<leader><tab>d",     "<cmd>tabclose<cr>",    "n", { desc = "Close Tab" } },
			{ "<leader><tab>[",     "<cmd>tabprevious<cr>", "n", { desc = "Previous Tab" } },

			-- Terminal Mappings
			{ "<esc><esc>",         "<c-\\><c-n>",          "t", { desc = "Enter Normal Mode" } },
			{ "<C-h>",              "<cmd>wincmd h<cr>",    "t", { desc = "Go to Left Window" } },
			{ "<C-j>",              "<cmd>wincmd j<cr>",    "t", { desc = "Go to Lower Window" } },
			{ "<C-k>",              "<cmd>wincmd k<cr>",    "t", { desc = "Go to Upper Window" } },
			{ "<C-l>",              "<cmd>wincmd l<cr>",    "t", { desc = "Go to Right Window" } },
			{ "<C-/>",              "<cmd>close<cr>",       "t", { desc = "Hide Terminal" } },
			{ "<c-_>",              "<cmd>close<cr>",       "t", { desc = "which_key_ignore" } },

			-- windows
			{ "<leader>w",          "<c-w>",                "n", { desc = "Windows", remap = true } },
			{ "<leader>-",          "<C-W>s",               "n", { desc = "Split Window Below", remap = true } },
			{ "<leader>|",          "<C-W>v",               "n", { desc = "Split Window Right", remap = true } },
			{ "<c-w>d",             "<C-W>c",               "n", { desc = "Delete Window", remap = true } },

			-- Clear search, diff update and redraw
			-- taken from runtime/lua/_editor.lua
			{
				"<leader>ur",
				"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
				"n",
				{ desc = "Redraw / Clear hlsearch / Diff Update" }
			},

			-- Add undo break-points
			{ ",",         ",<c-g>u",          "i" },
			{ ".",         ".<c-g>u",          "i" },
			{ ";",         ";<c-g>u",          "i" },

			-- save file
			{ "<C-s>",     "<cmd>w<cr><esc>",  { "i", "x", "n", "s" }, { desc = "Save File" } },

			--keywordprg
			{ "<leader>K", "<cmd>norm! K<cr>", "n",                    { desc = "Keywordprg" } },

			-- better indenting
			{ "<",         "v",                "<gv" },
			{ ">",         "v",                ">gv" },


		}
	},
}
