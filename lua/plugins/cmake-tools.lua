if vim.fn.filereadable(vim.uv.cwd() .. "/CMakeLists.txt") ~= 1 then
  return {}
end

local wk = require("which-key")
wk.add({
  { "<leader>m", group = "CMake" },
  { "<leader>ms", group = "Select" },
  { "<leader>msb", group = "Build" },
})

return {
  "Civitasv/cmake-tools.nvim",
  keys = {
    { "<leader>mg", ":CMakeGenerate<CR>", desc = "generate" },
    { "<leader>mb", ":CMakeBuild<CR>", desc = "build" },
    { "<leader>md", ":CMakeDebug<CR>", desc = "debug" },
    { "<leader>mr", ":CMakeRun<CR>", desc = "run" },
    { "<leader>mt", ":CMakeRunTest<CR>", desc = "ctest" },
    { "<leader>mc", ":CMakeClean<CR>", desc = "clean" },
    { "<leader>mi", ":CMakeInstall<CR>", desc = "install" },

    { "<leader>msbt", ":CMakeSelectBuildType<CR>", desc = "type" },
    { "<leader>msbd", ":CMakeSelectBuildDir<CR>", desc = "dir" },
    { "<leader>msbg", ":CMakeSelectBuildTarget<CR>", desc = "target" },
    { "<leader>msbp", ":CMakeSelectBuildPreset<CR>", desc = "preset" },
    { "<leader>msl", ":CMakeSelectLaunchTarget<CR>", desc = "launch target" },
    { "<leader>msk", ":CMakeSelectKit<CR>", desc = "kit" },
    { "<leader>msc", ":CMakeSelectConfigurePreset<CR>", desc = "configure preset" },
    { "<leader>mst", ":CMakeSettings<CR>", desc = "settings" },
  },
}
