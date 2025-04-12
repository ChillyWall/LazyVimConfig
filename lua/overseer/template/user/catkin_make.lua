return {
  name = "catkin make",
  builder = function(params)
    return {
      cmd = {
        "catkin_make",
      },
      args = {
        "-C",
        params.ws_dir,
        "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
      },
      components = {
        { "on_output_quickfix", close = false, open = true, set_diagnostics = true },
        "on_result_diagnostics",
        "default",
        {
          "run_after",
          task_names = { { "shell", cmd = ("ln -sf %s/build/compile_commands.json ./"):format(params.ws_dir) } },
        },
      },
    }
  end,
}
