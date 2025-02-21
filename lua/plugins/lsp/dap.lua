return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
        },
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
          "williamboman/mason.nvim",
        },
        opts = {
          handlers = {},
        },
      },
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "jbyuki/one-small-step-for-vimkind",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- local getOS = function()
      --   if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1 then
      --     return os.getenv("UserProfile") .. "/AppData/Local/nvim/mason/packages/codelldb/codelldb.exe"
      --   else -- I don't own/use a Mac, will update when/if I do
      --     return os.getenv("HOME") .. "/.local/share/nvim/mason/packages/codelldb/codelldb"
      --   end
      -- end
      --
      -- local lldbPath = getOS()
      --
      -- dap.adapters.codelldb = {
      --   type = "executable",
      --   command = lldbPath,
      --   env = {
      --     LLDG_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
      --   },
      --   name = "codelldb",
      --   detached = function()
      --     if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1 then
      --       return false
      --     else -- I don't own/use a Mac, will update when/if I do
      --       return true
      --     end
      --   end,
      -- }
      --
      -- dap.adapters.cpp = dap.adapters.codelldb
      --
      -- dap.configurations.cpp = {
      --   {
      --     name = "Launch file",
      --     type = "codelldb",
      --     request = "launch",
      --     program = function()
      --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      --     end,
      --     cwd = "${workspaceFolder}",
      --     stopOnEntry = false,
      --   },
      -- }

      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      -- -- GODOT DEBUGGING
      -- -- Need "netcat" installed
      dap.adapters.godot = {
        type = "server",
        host = "127.0.0.1",
        port = os.getenv("GDScript_Port") or "6007",
      }

      dap.configurations.gdscript = {
        -- dap.configurations.cs = {
        {
          launch_game_instance = false,
          launch_scene = false,
          name = "Launch Scene",
          project = "${workspaceFolder}",
          request = "launch",
          type = "godot",

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
        omnisharp_bin = os.getenv("UserProfile")
          .. "/AppData/Local/nvim/Utilities/omnisharp-mono_1.39.8/OmniSharp.exe"
        vim.g.OmniSharp_server_use_mono = true
      else -- I don't own/use a Mac, will update when/if I do
        -- omnisharp_bin = os.getenv("HOME") .. "/.config/nvim/Utilities/omnisharp-linux-x64_1.39.8/run"
        omnisharp_bin = os.getenv("HOME")
          -- .. "/.local/share/nvim/mason/packages/omnisharp/omnisharp"
          .. "/.config/nvim/Utilities/omnisharp-linux-x64-net6.0_1.39.8/OmniSharp"
        -- .. "/.config/nvim/Utilities/omnisharp-linux-x64-net6.0_1.39.11/OmniSharp"
      end

      dap.adapters.unity = {
        type = "executable",
        command = omnisharp_bin,
        args = { os.getenv("UNITY_DEBUG_DIR") },
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

      local dapBreakpoint = {
        breakpoint = {
          text = "●",
          texthl = "DapBreakpoint",
          linehl = "",
          numhl = "",
        },
        breakpointCondition = {
          text = "●",
          texthl = "DapBreakpointCondition",
          linehl = "",
          numhl = "",
        },
        dapLogPoint = {
          text = "◆",
          texthl = "DapLogPoint",
          linehl = "",
          numhl = "",
        },
        rejected = {
          text = "●",
          texthl = "LspDiagnosticsSignHint",
          linehl = "",
          numhl = "",
        },
        stopped = {
          text = "",
          texthl = "LspDiagnosticsSignInformation",
          linehl = "DiagnosticUnderlineInfo",
          numhl = "LspDiagnosticsSignInformation",
        },
      }

      sign("DapBreakpoint", dapBreakpoint.breakpoint)
      sign("DapBreakpointCondition", dapBreakpoint.breakpointCondition)
      sign("DapLogPoint", dapBreakpoint.dapLogPoint)
      sign("DapStopped", dapBreakpoint.stopped)
      sign("DapBreakpointRejected", dapBreakpoint.rejected)
      -- CATPPUCCIN COMPATIBILITY END

      dap.listeners.after.event_initialized.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      local whichKey = require("which-key")

      local opts = {
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
      }

      local extend = function(desc)
        vim.tbl_deep_extend("force", opts, { desc = desc })
      end

      whichKey.add({
        {
          {
            mode = { "n" },
            {
              -- { "<leader>dR", "<cmd>lua require('dap').run_to_cursor()<cr>", extend("Run to Cursor") },
              -- {
              --   "<leader>dE",
              --   "<cmd>lua require('dapui').eval(vim.fn.input '[Expression] > ')<cr>",
              --   extend("Evaluate Input"),
              -- },
              -- {
              --   "<leader>dC",
              --   "<cmd>lua require('dap').set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
              --   extend("Conditional Breakpoint"),
              -- },
              { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", extend("Toggle DAP UI") },
              {
                "<leader>db",
                "<cmd>lua require('dap').toggle_breakpoint()<cr>",
                extend("Toggle Breakpoint"),
              },
              { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", extend("Continue") },
              {
                "<leader>dr",
                "<cmd>lua require('dapui').open({reset = true})<cr>",
                extend("Reset DAP UI"),
              },
              -- { "<leader>dU", "<cmd>lua require('dapui').toggle()<cr>", extend("Toggle UI") },
              -- { "<leader>db", "<cmd>lua require('dap').step_back()<cr>", extend("Step Back") },
              -- { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", extend("Continue") },
              -- { "<leader>dD", "<cmd>lua require('dap').disconnect()<cr>", extend("Disconnect") },
              -- { "<leader>dg", "<cmd>lua require('dap').session()<cr>", extend("Get Session") },
              -- { "<leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<cr>", extend("Hover Variables") },
              -- { "<leader>dS", "<cmd>lua require('dap.ui.widgets').scopes()<cr>", extend("Scopes") },
              -- { "<leader>di", "<cmd>lua require('dap').step_into()<cr>", extend("Step Into") },
              -- { "<leader>do", "<cmd>lua require('dap').step_over()<cr>", extend("Step Over") },
              -- { "<leader>dp", "<cmd>lua require('dap').pause.toggle()<cr>", extend("Pause") },
              -- { "<leader>dq", "<cmd>lua require('dap').close()<cr>", extend("Quit") },
              -- { "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>", extend("Toggle Repl") },
              -- { "<leader>ds", "<cmd>lua require('dap').continue()<cr>", extend("Start") },
              -- { "<leader>dt", "<cmd>lua require('dap').toggle_breakpoint()<cr>", extend("Toggle Breakpoint") },
              -- { "<leader>dx", "<cmd>lua require('dap').terminate()<cr>", extend("Terminate") },
              -- { "<leader>du", "<cmd>lua require('dap').step_out()<cr>", extend("Step Out") },
            },
          },
          -- {
          --   mode = { "n", "v" },
          --   { "<leader>de", "<cmd>lua require('dapui').eval()<cr>", extend("Evaluate") },
          -- },
        },
      })
    end,
  },
}
