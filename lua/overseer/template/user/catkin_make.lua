return {
  name = "catkin make",
  builder = function()
    return {
      cmd = {
        "catkin_make",
      },
      args = {
        "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
      },
      cwd = vim.fn.getcwd(),
      components = {
        { "on_output_quickfix", close = true, open = true, set_diagnostics = true },
        "on_result_diagnostics",
        "default",
        {
          "run_after",
          task_names = { { "shell", cmd = "ln -sf build/compile_commands.json ./" } },
        },
      },
    }
  end,
}
