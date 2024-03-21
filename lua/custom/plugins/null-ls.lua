-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- return {
--   {
--     "jose-elias-alvarez/null-ls.nvim",
--     sources = {
--       require('null-ls').builtins.formatting.prettier,
--       require('null-ls').builtins.formatting.goimports,
--       require('null-ls').builtins.formatting.elm_format,
--       require('null-ls').builtins.formatting.shfmt,
--       require('null-ls').builtins.diagnostics.shellcheck,
--   },
--   -- you can reuse a shared lspconfig on_attach callback here
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = bufnr })
--         end,
--       })
--     end
--   end,
--   }
-- }

return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    return {
      sources = {
        formatting.stylua,
        formatting.prettier,
        formatting.eslint,
        formatting.fish_indent,
        -- diagnostics.eslint,
        diagnostics.fish,
        -- diagnostics.tsc,
        -- code_actions.eslint,
        code_actions.gitsigns,
        completion.spell
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
          -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
      -- on_attach = function(client, bufnr)
      --   -- Enable formatting on sync
      --   if client.supports_method("textDocument/formatting") then
      --     local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
      --     vim.api.nvim_create_autocmd('BufWritePre', {
      --       group = format_on_save,
      --       buffer = bufnr,
      --       callback = function()
      --         vim.lsp.buf.format({
      --           bufnr = bufnr,
      --           filter = function(_client)
      --             return _client.name == "null-ls"
      --           end
      --         })
      --       end,
      --     })
      --   end
      -- end,
    }
  end,
}
