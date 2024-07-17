local M = {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
  }
  
  local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1
  
    if not directory then
      return
    end
  
    -- change to the directory
    vim.cmd.cd(data.file)
  
    -- open the tree
    require("nvim-tree.api").tree.open()
  end
  
  M.init = function()
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end
  
  M.config = function()
    local status_ok, tree = pcall(require, "nvim-tree")
    if not status_ok then
      return
    end
    local icons = require("mahmud.utils.icons")
  
    tree.setup({
      renderer = {
        special_files = {
          "package.json",
          "README.md",
          "index.js",
          "index.ts",
          "index.tsx",
          "Makefile",
        },
        group_empty = true,
        root_folder_modifier = ":t",
        highlight_git = true,
        indent_markers = {
          enable = false,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
          },
        },
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            git = {
              unstaged = icons.git.Modified,
              staged = icons.git.add,
              renamed = icons.git.Rename,
              untracked = "?",
              unmerged = icons.git.Diff,
              deleted = icons.git.deleted,
              ignored = icons.git.Ignore,
            },
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
          },
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = false,
          },
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
      disable_netrw = false,
      auto_reload_on_write = true,
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable = true,
      },
      filters = {
        dotfiles = false,
        custom = {
          "^\\.git",
          "^\\.cache",
          "^\\.DS_Store",
          "^\\.idea",
          "^\\.next",
          "node_modules",
          "^\\.yarn",
          "^\\.husky",
        },
        exclude = {
          "^dist",
          ".gitignore",
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      actions = {
        remove_file = {
          close_window = false,
        },
        open_file = {
          resize_window = true,
          quit_on_open = false,
          window_picker = {
            enable = false,
          },
        },
      },
      view = {
        width = 40,
        side = "right",
        relativenumber = false,
        preserve_window_proportions = true,
        centralize_selection = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      update_cwd = false,
    })

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer

  end
  
  return M
