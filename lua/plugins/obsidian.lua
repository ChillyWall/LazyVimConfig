vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    local wk = require("which-key")
    wk.add({
      { "<localleader>o", group = "Obsidian" },
      { "<localleader>od", ":ObsidianDailies<CR>", desc = "Obsidian dailies" },
      { "<localleader>ot", ":ObsidianTags<CR>", desc = "Obsidian tags" },
      { "<localleader>oc", ":ObsidianTOC<CR>", desc = "Obsidian TOC" },
      { "<localleader>oo", ":ObsidianOpen", desc = "Obsidian open" },
      { "<localleader>os", ":ObsidianSearch<CR>", desc = "Obsidian search" },
      { "<localleader>on", ":ObsidianNew<CR>", desc = "Obsidian new note" },
      { "<localleader>oN", ":ObsidianNewFromTemplate", desc = "Obsidian new note from template" },
      { "<localleader>or", ":ObsidianRename<CR>", desc = "Obsidian rename" },
      { "<localleader>ow", ":ObsidianWorkspace<CR>", desc = "Obsidian workspace" },
      { "<localleader>ol", ":ObsidianLink", desc = "Obsidian link", mode = { "n", "v" } },
      { "<localleader>oL", ":ObsidianLinks<CR>", desc = "Obsidian links" },
      { "<localleader>oq", ":ObsidianQuickSwitch<CR>", desc = "Obsidian quick switch" },
    })
  end,
})

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },

  opts = {
    -- A list of workspace names, paths, and configuration overrides.
    -- If you use the Obsidian app, the 'path' of a workspace should generally be
    -- your vault root (where the `.obsidian` folder is located).
    -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
    -- the workspace to the first workspace in the list whose `path` is a parent of the
    -- current markdown file being edited.
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "learning",
        path = "~/vaults/learning",
        -- Optional, override certain settings.
        overrides = {
          notes_subdir = "notes",
        },
      },
    },

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "notes/dailies",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil,
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Enables completion using nvim_cmp
      nvim_cmp = false,
      -- Enables completion using blink.cmp
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },

    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Smart action depending on context: follow link, show notes with tag, or toggle checkbox.
      ["<C-CR>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },

    ui = {
      enable = false,
    },
  },
}
