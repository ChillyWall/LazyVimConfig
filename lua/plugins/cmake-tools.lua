vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    local cwd = vim.uv.cwd()
    if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
      local wk = require("which-key")
      wk.add({
        { "<localleader>m", group = "CMake" },
        { "<localleader>mg", ":CMakeGenerate<CR>", desc = "generate" },
        { "<localleader>mb", ":CMakeBuild<CR>", desc = "build" },
        { "<localleader>md", ":CMakeDebug<CR>", desc = "debug" },
        { "<localleader>mr", ":CMakeRun<CR>", desc = "run" },
        { "<localleader>mt", ":CMakeRunTest<CR>", desc = "ctest" },
        { "<localleader>mc", ":CMakeClean<CR>", desc = "clean" },
        { "<localleader>mi", ":CMakeInstall<CR>", desc = "install" },

        { "<localleader>ms", group = "Select" },
        { "<localleader>msl", ":CMakeSelectLaunchTarget<CR>", desc = "launch target" },
        { "<localleader>msk", ":CMakeSelectKit<CR>", desc = "kit" },
        { "<localleader>msp", ":CMakeSelectConfigurePreset<CR>", desc = "preset" },
        { "<localleader>mst", ":CMakeSettings<CR>", desc = "settings" },

        { "<localleader>msb", group = "Build" },
        { "<localleader>msbt", ":CMakeSelectBuildType<CR>", desc = "type" },
        { "<localleader>msbd", ":CMakeSelectBuildDir<CR>", desc = "dir" },
        { "<localleader>msbg", ":CMakeSelectBuildTarget<CR>", desc = "target" },
        { "<localleader>msbp", ":CMakeSelectBuildPreset<CR>", desc = "preset" },
      })
    end
  end,
})

return {}
