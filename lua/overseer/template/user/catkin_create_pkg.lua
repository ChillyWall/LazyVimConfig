return {
  name = "catkin create package",
  builder = function(params)
    return {
      cmd = {
        "catkin_create_pkg",
      },
      args = {
        params.args,
      },
      components = {
        { "on_output_quickfix", close = true, open = true, set_diagnostics = true },
        "on_result_diagnostics",
        "default",
      },
    }
  end,
}
