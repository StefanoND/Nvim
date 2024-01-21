local dap = require("dap")
local dapui = require("dapui")

-- GODOT DEBUGGING
-- Need "netcat" installed
dap.adapters.godot = {
  type = "server",
  host = "127.0.0.1",
  port = 6006,
}

dap.configurations.gdscript = {
  {
    name = "Launch",
    type = "godot",
    request = "launch",
    project = "${workspaceFolder}",
    launch_scene = true,

    -- address = "127.0.0.1",
    -- port = 6006,
    -- scene = "main|current|pinned|<path>",
    -- editor_path = "<path>",
    -- -- engine command line flags
    -- profiling = false,
    -- single_threaded_scene = false,
    -- debug_collisions = false,
    -- debug_paths = false,
    -- debug_navigation = false,
    -- debug_avoidance = false,
    -- debug_stringnames = false,
    -- frame_delay = 0,
    -- time_scale = 1.0,
    -- disable_vsync = false,
    -- fixed_fps = 60,
    -- -- anything else
    -- additional_options = "",
  },
}

-- UNITY DEBUGGING
-- https://docs.unity3d.com/Manual/ManagedCodeDebugging.html
local omnisharp_bin
if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1 then
  omnisharp_bin = os.getenv("UserProfile") .. "/AppData/Local/nvim/omnisharp-mono_1.39.8/OmniSharp.exe"
  vim.g.OmniSharp_server_use_mono = true
else -- I don't own/use a Mac, will update when/if I do
  omnisharp_bin = os.getenv("HOME") .. "/.config/nvim/omnisharp-linux-x64_1.39.8/run"
end

dap.adapters.unity = {
  type = "executable",
  command = omnisharp_bin,
  args = { "/mnt/SSD_1TB_WORK/Unity/Editors/2023.2.5f1/Editor/Unity_s.debug" },
}

dap.configurations.cs = {
  {
    type = "unity",
    request = "attach",
    name = "Unity Editor",
  },
}

dapui.setup()
require("nvim-dap-virtual-text").setup()

-- CATPPUCCIN COMPATIBILITY START
local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
-- CATPPUCCIN COMPATIBILITY END

-- vim.fn.sign_define(
--   "DapBreakpoint",
--   { text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local opts = { noremap = true }

vim.keymap.set("n", "<leader>dt", "<cmd>DapUiToggle<CR>", opts)
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", opts)
vim.keymap.set("n", "<leader>dr", "<cmd>require('dapui').open({reset = true})<CR>", opts)
