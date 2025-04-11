return {
  name = "create soft link to compile_commands.json",
  builder = function()
    require("lfs")
    local file = "build/compile_commands.json"
    return {
      cmd = { "ln" },
      args = { "-s", file, "./" },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
}
