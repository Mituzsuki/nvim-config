return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
  },
  {
    "rcarriga/nvim-dap-ui", -- Optional, for a nice UI for debugging
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim", -- Mason integration for DAP
      "nvim-neotest/nvim-nio",     -- Required for nvim-dap-ui
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      -- Auto open/close DAP-UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      -- Add C# Debugger (netcoredbg)
      dap.adapters.coreclr = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          request = "launch",
          name = "Launch .NET",
          program = function()
            return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/bin/Debug/net7.0/", "file")
          end,
        },
      }
      -- Define keybindings
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)            -- Start/Continue Debugging
      keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)          -- Step Over
      keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)          -- Step Into
      keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)           -- Step Out
      keymap("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts) -- Toggle Breakpoint
      keymap(
        "n",
        "<Leader>B",
        ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        opts
      )                                                                 -- Conditional Breakpoint
      keymap("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>", opts) -- Open REPL
      keymap("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", opts) -- Run Last Debug Session
      keymap("n", "<Leader>du", ":lua require'dapui'.toggle()<CR>", opts) -- Toggle DAP-UI
      keymap("n", "<Leader>dq", ":lua require'dap'.terminate()<CR>", opts) -- Quit Debugging
    end,
  },
}
