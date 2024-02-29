return {
  {
    "neovim/nvim-lspconfig",
    -- enabled = false,
    init = function()
      vim.g.autoformat = true
    end,
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("lazyvim.config").icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = require("lazyvim.config").icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = require("lazyvim.config").icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = require("lazyvim.config").icons.diagnostics.Info,
          },
        },
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },
      -- add any global capabilities here
      capabilities = {},
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeysSpec[]
          -- keys = {},
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        tsserver = {
          -- capabilities = lsp_capabilities,
          ---@type LazyKeysSpec[]
          init_options = {
            hostInfo = "neovim",
            preferences = {
              -- other preferences...
              importModuleSpecifierPreference = "relative",
              importModuleSpecifierEnding = "minimal",
            },
          },
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        -- require("typescript").setup({ server = opts })
        -- return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts)
        --   print(server)
        -- end,
      },
    },

    ---@param opts PluginLspOpts
    config = function(_, opts)
      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
      end
    end,
    keys = {
      { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions", noremap = true },
      {
        "<S-k>",
        "<cmd>lua vim.lsp.buf.hover()<CR>",
        desc = "Show hover info",
        noremap = true,
      },
      {
        "gr",
        "<cmd>Telescope lsp_references<CR>",
        desc = "Go to references",
        noremap = true,
      },
      {
        "gd",
        "<cmd>Telescope lsp_definitions<CR>",
        desc = "Go to definitions",
        noremap = true,
      },
      {
        "gy",
        "<cmd>Telescope lsp_type_definitions<CR>",
        desc = "Go to type definition",
        noremap = true,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    config = {},
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
    end,
  },
}
