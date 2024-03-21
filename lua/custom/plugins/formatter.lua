return {
  "mhartington/formatter.nvim",
  opts = function()
    return {
      logging = true,
      filetype = {
        typescript = {
          function()
            return {
              exe = "npx",
              args = { "prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
              stdin = true
            }
          end
        },
        typescriptreact = {
          function()
            return {
              exe = "npx",
              args = { "prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
              stdin = true
            }
          end
        },
        javascript = {
          function()
            return {
              exe = "npx",
              args = { "prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
              stdin = true
            }
          end
        },
        javascriptreact = {
          function()
            return {
              exe = "npx",
              args = { "prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
              stdin = true
            }
          end
        },
        json = {
          function()
            return {
              exe = "npx",
              args = { "prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
              stdin = true
            }
          end
        }
      }
    }
  end,
}
