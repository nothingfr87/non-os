return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      servers = { "nil", "pyright", "clangd", "ts_ls", "html", "cssls", "emmet_ls" }

      for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, {
          capabilities = capabilities,
        })
      end
      vim.lsp.enable(servers)

      -- Fixed lua_ls autoattach
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.bo.filetype == "lua" then
            vim.lsp.enable("lua_ls")
          end
        end,
      })
    end,
  },

  -- CMP
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-e>"] = { "cancel" },
        ["<C-Space>"] = { "show" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
        },
        trigger = {
          show_on_keyword = true,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "cmdline" },
      },
    },
    opts_extend = { "sources.default" },
  },

  -- Conform
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "autopep8" },
          cpp = { "clang-format" },
          c = { "clang-format" },
          html = { "prettier" },
          css = { "prettier" },
          javascript = { "prettier" },
          nix = { "nixpkgs-fmt" },
        },
      })

      require("conform").setup({
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = "fallback",
        },
      })
    end,
  },
}
