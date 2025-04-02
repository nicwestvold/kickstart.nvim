-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    -- { '<leader><Enter>', ':Neotree toggle<CR>', desc = 'NeoTree open', silent = true },
    { '<leader><Enter>', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>f', ':Neotree toggle reveal_force_cwd<CR>', desc = 'NeoTree toggle with CWD', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    event_handlers = {
      {
        event = 'file_opened',
        handler = function()
          -- Put your logic here for what happens when a file is opened
          -- For example, close Neo-tree window after opening a file:
          require('neo-tree.command').execute { action = 'close' }

          -- You can add other custom logic here
          -- print("Opened file: " .. file_path)
        end,
      },
    },
  },
}
