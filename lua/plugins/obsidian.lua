vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    local wk = require("which-key")
    wk.add({
      { "<localleader>o", group = "Obsidian" },
      { "<localleader>od", ":Obsidian dailies<CR>", desc = "Obsidian dailies" },
      { "<localleader>oe", ":Obsidian extract_note<CR>", desc = "Obsidian extract into new note" },
      { "<localleader>ot", ":Obsidian tags<CR>", desc = "Obsidian tags" },
      { "<localleader>oT", ":Obsidian template<CR>", desc = "Obsidian insert template" },
      { "<localleader>oc", ":Obsidian toc<CR>", desc = "Obsidian TOC" },
      { "<localleader>oo", ":Obsidian open", desc = "Obsidian open" },
      { "<localleader>os", ":Obsidian search<CR>", desc = "Obsidian search" },
      { "<localleader>on", ":Obsidian new<CR>", desc = "Obsidian new note" },
      { "<localleader>oN", ":Obsidian new_from_template<CR>", desc = "Obsidian new note from template" },
      { "<localleader>or", ":Obsidian rename<CR>", desc = "Obsidian rename" },
      { "<localleader>ow", ":Obsidian workspace<CR>", desc = "Obsidian workspace" },
      { "<localleader>ol", ":Obsidian link", desc = "Obsidian link", mode = { "n", "v" } },
      { "<localleader>oL", ":Obsidian links<CR>", desc = "Obsidian links" },
      { "<localleader>oq", ":Obsidian quick_switch<CR>", desc = "Obsidian quick switch" },
      { "<localleader>op", ":Obsidian paste_img<CR>", desc = "Obsidian paste image" },
    })
  end,
})

return {
  {
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
      footer = {
        enabled = false,
      },
      statusline = {
        enabled = true, -- turn it off
        format = "{{backlinks}} backlinks  {{properties}} properties  {{words}} words  {{chars}} chars", -- works like the template system
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_x = {
          "g:obsidian",
        },
      },
    },
  },
}
