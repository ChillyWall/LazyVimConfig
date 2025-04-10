local M = {}

local loc_pkg = function(pkg_name)
  local handle = io.popen("rospack find " .. pkg_name)
  if not handle then
    vim.notify("Failed to execute rospack", vim.log.levels.ERROR)
    return nil
  end

  local dirs = {}
  for line in handle:lines() do
    table.insert(dirs, line)
  end
  local dir = dirs[1]
  return dir
end

local node_info = function(node)
  local handle = io.popen("rosnode info " .. node)
  if not handle then
    vim.notify("Failed to execute rosnode", vim.log.levels.ERROR)
    return nil
  end

  local info = handle:read("*a")
  return info
end

local topic_info = function(topic)
  local handle = io.popen("rostopic info " .. topic)
  if not handle then
    vim.notify("Failed to execute rostopic", vim.log.levels.ERROR)
    return nil
  end

  local info = handle:read("*a")
  return info
end

local service_info = function(service)
  local handle = io.popen("rosservice info " .. service)
  if not handle then
    vim.notify("Failed to execute rosservice", vim.log.levels.ERROR)
    return nil
  end

  local info = handle:read("*a")
  return info
end

local find_pkgs = function()
  local items = {}
  local handle = io.popen("rospack list-names")
  if not handle then
    vim.notify("Failed to execute rospack list-names")
    return nil
  end
  for line in handle:lines() do
    table.insert(items, {
      text = line,
      file = loc_pkg(line),
    })
  end
  return items
end

local find_nodes = function()
  local handle = io.popen("rosnode list")
  if not handle then
    vim.notify("Failed to execute rosnode", vim.log.levels.ERROR)
    return nil
  end
  local nodes = {}
  for line in handle:lines() do
    table.insert(nodes, {
      text = line,
      preview = {
        text = node_info(line),
      },
    })
  end
  return nodes
end

local find_topics = function()
  local handle = io.popen("rostopic list")
  if not handle then
    vim.notify("Failed to execute rostopic", vim.log.levels.ERROR)
    return nil
  end
  local topics = {}
  for line in handle:lines() do
    table.insert(topics, {
      text = line,
      preview = {
        text = topic_info(line),
      },
    })
  end
  return topics
end

local find_service = function()
  local handle = io.popen("rosservice list")
  if not handle then
    vim.notify("Failed to execute rosservice", vim.log.levels.ERROR)
    return nil
  end
  local service = {}
  for line in handle:lines() do
    table.insert(service, {
      text = line,
      preview = {
        text = service_info(line),
      },
    })
  end
  return service
end

local change_directory = function(item)
  if not item then
    return
  end
  local pkg_name = item.text
  local dir = loc_pkg(pkg_name)

  if not dir then
    vim.notify("Failed to locate the package " .. pkg_name)
  end

  ---@diagnostic disable: param-type-mismatch
  vim.fn.chdir(dir)
end

function M.roscd()
  Snacks.picker({
    items = find_pkgs(),
    preview = "file",
    format = function(item)
      local ret = {}
      ret[#ret + 1] = { item.text, "SnacksPickerLabel" }
      ret[#ret + 1] = { ("(%s)"):format(item.file), "SnacksPickerComment" }
      return ret
    end,
    confirm = function(picker, item)
      picker:close()
      change_directory(item)
    end,
  })
end

function M.rosnode()
  Snacks.picker({
    items = find_nodes(),
    preview = "preview",
    format = "text",
    confirm = function(picker, item)
      picker:close()
    end,
  })
end

function M.rostopic()
  Snacks.picker({
    items = find_topics(),
    preview = "preview",
    format = "text",
    confirm = function(picker, item)
      picker:close()
    end,
  })
end

function M.rosservice()
  Snacks.picker({
    items = find_service(),
    preview = "preview",
    format = "text",
    confirm = function(picker, item)
      picker:close()
    end,
  })
end

function M.catkin_make()
  if vim.fn.filereadable("./.catkin_workspace") == 1 then
    local overseer = require("overseer")
    overseer.run_template({ name = "catkin make" })
  else
    vim.notify("The cwd is not a catkin workspace", vim.log.levels.ERROR)
  end
end

return M
