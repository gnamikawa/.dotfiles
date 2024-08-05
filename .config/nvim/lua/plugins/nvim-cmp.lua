return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    opts = function()
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = true

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end

      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() then
                cmp.confirm()
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          }),
          ["<S-j>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item()
            end
          end),
          ["<S-k>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end),
          -- ["<S-j>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   elseif vim.fn["vsnip#available"](1) == 1 then
          --     feedkey("<Plug>(vsnip-expand-or-jump)", "")
          --   elseif has_words_before() then
          --     cmp.complete()
          --   else
          --     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          --   end
          -- end, { "n", "s" }),
          -- ["<S-k>"] = cmp.mapping(function()
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          --     feedkey("<Plug>(vsnip-jump-prev)", "")
          --   end
          -- end, { "n", "s" }),
          ["<Esc>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        -- formatting = {
        -- format = function(entry, item)
        --   local icons = LazyVim.config.icons.kinds
        --   if icons[item.kind] then
        --     item.kind = icons[item.kind] .. item.kind
        --   end
        --
        --   local widths = {
        --     abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
        --     menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
        --   }
        --
        --   for key, width in pairs(widths) do
        --     if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
        --       item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
        --     end
        --   end
        --
        --   return item
        -- end,
        -- },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
    -- main = "lazyvim.util.cmp",
  }
}
