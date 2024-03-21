-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
          }
        },
        event_handlers = {

          {
            event = "file_opened",
            handler = function()
              -- auto close
              -- vimc.cmd("Neotree close")
              -- OR
              require("neo-tree.command").execute({ action = "close" })
            end
          },

        }
      }

      vim.keymap.set('n', '<leader><Enter>', ":Neotree toggle<CR>", { desc = 'Open Neotree' })
      vim.keymap.set('n', '<leader>f', ":Neotree toggle reveal_force_cwd<CR>",
        { desc = 'Open Neotree in current directory' })
    end,
  }
}
