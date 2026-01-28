return {
  "juaniraggio/vired.nvim",
  config = function()
    require("vired").setup({
      -- Columns in directory buffer
      columns = { "icon", "permissions", "size", "mtime" },

      -- Path picker
      path_picker = {
        backend = "telescope",  -- "auto" | "telescope" | "fzf" | "lua"
        sources = { "filesystem", "recent", "bookmarks", "buffers" },
        create_directories = true,
        show_hidden = false,
      },

      -- Behavior
      delete_to_trash = true,
      confirm_delete = true,
      skip_confirm_single = true,
      use_picker_by_default = false,

      -- LSP integration
      lsp = {
        enabled = true,
        timeout_ms = 3000,
      },

      -- Git integration
      git = {
        auto_add = false,
        use_git_mv = true,
        use_git_rm = true,
      },

      -- Preview
      preview = {
        max_lines = 100,
        max_file_size = 1024 * 1024,
        auto_preview = false,
      },

      -- Buffer editing
      buffer_editing = {
        enabled = true,
        confirm_changes = true,
      },

      -- Projects
      projects = {
        auto_prompt = true,
        auto_cd = true,
        markers = {
          ".git", ".hg", ".svn",
          "package.json", "Cargo.toml", "go.mod",
          "Makefile", "CMakeLists.txt",
          "pyproject.toml", "setup.py",
        },
        sort_by = "recent",
      },

      -- File watcher
      watcher = {
        enabled = true,
        debounce_ms = 200,
      },

      -- Floating windows
      float = {
        border = "rounded",
        width = 0.8,
        height = 0.8,
      },

      -- Keymaps
      keymaps = {
        ["<CR>"] = "actions.select",
        ["-"] = "actions.parent",
        ["q"] = "actions.close",
        ["gr"] = "actions.refresh",
        ["g."] = "actions.toggle_hidden",
        ["gw"] = "actions.toggle_watch",
        ["<C-o>"] = "actions.jump_back",
        ["<C-i>"] = "actions.jump_forward",
        ["<Tab>"] = "actions.preview",
        ["m"] = "actions.toggle_mark",
        ["u"] = "actions.unmark",
        ["U"] = "actions.unmark_all",
        ["R"] = "actions.move",
        ["C"] = "actions.copy",
        ["D"] = "actions.delete",
        ["+"] = "actions.mkdir",
        ["%"] = "actions.touch",
        ["<M-e>"] = "actions.edit",
        ["<C-z>"] = "actions.undo",
        ["<C-y>"] = "actions.redo",
        ["?"] = "actions.help",
      },
    })
  end,
}
