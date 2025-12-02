return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "toggle_node",
          ["<2-LeftMouse>"] = "open",
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
        },
      },
      default_component_configs = {
        indent = {
          padding = 0,
          indent_size = 2,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        modified = {
          symbol = " ● ",
          highlight = "NeoTreeModified",
        },
        git_status = {
          symbols = {
            added = "✓",
            deleted = "✕",
            modified = "",
            renamed = "➜",
            untracked = "?",
            ignored = "◌",
            unstaged = "U",
            staged = "S",
            conflict = "═",
          },
        },
      },
    })
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {})
  end
}
