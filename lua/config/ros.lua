local M = {}

local overseer = require("overseer")

---@param node string
---@return string
local node_info = function(node)
  local handle = io.popen("rosnode info " .. node)
  if handle then
    return handle:read("*a")
  else
    return ""
  end
end

---@param topic string
---@return string
local topic_info = function(topic)
  local handle = io.popen("rostopic info " .. topic)
  if not handle then
    vim.notify("Failed to execute rostopic", "error")
    return ""
  end

  local info = handle:read("*a")
  return info
end

---@param service string
---@return string
local service_info = function(service)
  local handle = io.popen("rosservice info " .. service)
  if not handle then
    vim.notify("Failed to execute rosservice", "error")
    return ""
  end

  local info = handle:read("*a")
  return info
end

---@param msg string
---@return string
local msg_info = function(msg)
  local handle = io.popen("rosmsg show " .. msg)
  if not handle then
    vim.notify("Failed to execute rosmsg", "error")
    return ""
  end

  local info = handle:read("*a")
  return info
end

---@param item snacks.picker.Item
local change_directory = function(item)
  local dir = item.file
  vim.fn.chdir(dir)
end

function M.roscd()
  Snacks.picker.pick({
    source = "roscd",
    finder = function(opts, ctx)
      return require("snacks.picker.source.proc").proc({
        opts,
        {
          cmd = "rospack",
          args = {
            "list",
          },
          transform = function(item)
            local words = {}
            for str in item.text:gmatch("%S+") do
              table.insert(words, str)
            end
            item.text = words[1]
            item.file = words[2]
          end,
        },
      }, ctx)
    end,
    preview = "file",
    format = function(item)
      return {
        { item.text, "SnacksPickerLabel" },
        { ("(%s)"):format(item.file), "SnacksPickerComment" },
      }
    end,
    confirm = function(picker, item)
      picker:close()
      change_directory(item)
    end,
  })
end

function M.rosnode()
  local function find_nodes(opts, ctx)
    return require("snacks.picker.source.proc").proc({
      opts,
      {
        cmd = "rosnode",
        args = {
          "list",
        },
        transform = function(item)
          item.preview = {
            text = "",
          }
        end,
      },
    }, ctx)
  end

  Snacks.picker.pick({
    source = "rosnode",
    finder = find_nodes,
    preview = function(ctx)
      ctx.item.preview.text = node_info(ctx.item.text)
      require("snacks").picker.preview.preview(ctx)
    end,
    format = function(item)
      return {
        { item.text, "SnacksPickerLabel" },
      }
    end,
    confirm = function(picker, item)
      picker:close()
    end,
  })
end

function M.rostopic()
  local function find_topics(opts, ctx)
    return require("snacks.picker.source.proc").proc({
      opts,
      {
        cmd = "rostopic",
        args = {
          "list",
        },
        transform = function(item)
          item.preview = {
            text = "",
          }
        end,
      },
    }, ctx)
  end

  Snacks.picker.pick({
    source = "rostopic",
    finder = find_topics,
    preview = function(ctx)
      ctx.item.preview.text = topic_info(ctx.item.text)
      require("snacks").picker.preview.preview(ctx)
    end,
    format = function(item)
      return {
        { item.text, "SnacksPickerLabel" },
      }
    end,
    confirm = function(picker, item)
      picker:close()
    end,
  })
end

function M.rosservice()
  local function find_services(opts, ctx)
    return require("snacks.picker.source.proc").proc({
      opts,
      {
        cmd = "rosservice",
        args = {
          "list",
        },
        transform = function(item)
          item.preview = {
            text = "",
          }
        end,
      },
    }, ctx)
  end

  Snacks.picker.pick({
    source = "rosservice",
    finder = find_services,
    preview = function(ctx)
      ctx.item.preview.text = service_info(ctx.item.text)
      require("snacks").picker.preview.preview(ctx)
    end,
    format = function(item)
      return {
        { item.text, "SnacksPickerLabel" },
      }
    end,
    confirm = function(picker, item)
      picker:close()
    end,
  })
end

function M.rosmsg()
  local function find_msgs(opts, ctx)
    return require("snacks.picker.source.proc").proc({
      opts,
      {
        cmd = "rosmsg",
        args = {
          "list",
        },
        transform = function(item)
          item.preview = {
            text = "",
          }
        end,
      },
    }, ctx)
  end

  Snacks.picker.pick({
    source = "rosmsg",
    finder = find_msgs,
    preview = function(ctx)
      ctx.item.preview.text = msg_info(ctx.item.text)
      require("snacks").picker.preview.preview(ctx)
    end,
    format = function(item)
      return {
        { item.text, "SnacksPickerLabel" },
      }
    end,
    confirm = function(picker, item)
      picker:close()
    end,
  })
end

---@param path string
---@return string
local function get_parent_dir(path)
  return path:match("(.*)/.+")
end

---@return string|nil
local function get_current_ws()
  local ws = vim.fn.getcwd()
  while vim.fn.filereadable(ws .. "/.catkin_workspace") == 0 and ws ~= "" do
    ws = get_parent_dir(ws)
  end
  if ws == "" then
    return nil
  else
    return ws
  end
end

function M.catkin_make()
  local ws = get_current_ws()
  if ws == nil then
    vim.notify("No catkin workspace found", "error")
  else
    overseer.run_template({ name = "catkin make", params = { ws_dir = ws } })
  end
end

---@param args string
function M.catkin_create_pkg(args)
  local ws = get_current_ws()
  if ws == nil then
    vim.notify("No catkin workspace found", "error")
  else
    overseer.run_template({ name = "catkin create package", params = { args = args } })
  end
end

vim.api.nvim_create_user_command("CatkinMake", function()
  M.catkin_make()
end, { nargs = 0 })

vim.api.nvim_create_user_command("RosCd", function(opts)
  M.roscd()
end, { nargs = 0 })

vim.api.nvim_create_user_command("CatkinCreatePkg", function(opts)
  M.catkin_create_pkg(opts.args)
end, {
  nargs = "+",
  complete = function(arg_lead, cmdline, cursor_pos)
    local items = {}
    if cmdline:match("^CatkinCreatePkg %S+ .*") then
      local handle = io.popen("rospack list-names")
      if not handle then
        vim.notify("Failed to execute rospack list-names", "error")
        return items
      end
      for line in handle:lines() do
        if line:find("^" .. arg_lead) then
          table.insert(items, line)
        end
      end
    end
    return items
  end,
})

vim.filetype.add({
  pattern = {
    [".*.launch"] = "xml",
    [".*.rviz"] = "yaml",
    [".*.world"] = "xml",
  },
})

local wk = require("which-key")
wk.add({
  { "<leader>r", group = "refactor/ros" },
  { "<leader>ro", group = "ros" },
  {
    "<leader>roc",
    function()
      M.roscd()
    end,
    desc = "roscd",
  },
  {
    "<leader>rok",
    function()
      M.catkin_make()
    end,
    desc = "catkin_make",
  },
  {
    "<leader>ron",
    function()
      M.rosnode()
    end,
    desc = "rosnode",
  },
  {
    "<leader>rot",
    function()
      M.rostopic()
    end,
    desc = "rostopic",
  },
  {
    "<leader>ros",
    function()
      M.rosservice()
    end,
    desc = "rosservice",
  },
  {
    "<leader>rom",
    function()
      M.rosmsg()
    end,
    desc = "rosmsg",
  },
  {
    "<leader>rop",
    ":CatkinCreatePkg ",
    desc = "catkin_create_pkg",
  },
})

return M
