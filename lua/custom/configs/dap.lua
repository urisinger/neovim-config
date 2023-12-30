local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
}



dap.configurations.zig = {
  {
    name = "Launch",
    type = "gdb",
    request = "attach",
    program = function()
      return "/use/bin/zig"
    end,
    --args = {"build", "-Doptimize=Debug", "run"},
    cwd = "${workspaceFolder}",
  },
}
