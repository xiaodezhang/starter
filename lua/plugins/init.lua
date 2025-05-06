return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "xiaodezhang/switch.nvim",
    lazy = false,
    config = function()
      require("switch").setup()
    end
  },

  {
    "mhinz/vim-startify",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  -- 这个插件会导致卡顿
  -- {
  --   'RRethy/vim-illuminate',
  --   lazy = false,
  -- },
  {
    'kevinhwang91/nvim-hlslens',
    lazy = false,
    config = function()
      require("hlslens").setup()
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = false,
  },
  -- {
  --   "vim-scripts/a.vim",
  --   lazy = false,
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   lazy = false,
  -- },
  -- {
  --   "mfussenegger/nvim-dap-python",
  --   lazy = false,
  --   config = function()
  --     require('dap-python').setup("python")
  --     local ppath = '${workspaceFolder}/env/Scripts/python'
  --     if vim.fn.filereadable(ppath) == 1 then
  --       require('dap').configurations.python = {
  --         {
  --           type = 'python',
  --           request = 'launch',
  --           name = 'Launch file',
  --           program = '${file}',
  --           pythonPath = ppth,
  --           cwd = '${workspaceFolder}',
  --           justMyCode = false
  --         },
  --       }
  --     else 
  --       require('dap').configurations.python = {
  --         {
  --           type = 'python',
  --           request = 'launch',
  --           name = 'Launch file',
  --           program = '${file}',
  --           cwd = '${workspaceFolder}',
  --           justMyCode = false
  --         },
  --       }
  --     end
  --   end,
  -- },
  -- {
  --   "theHamsta/nvim-dap-virtual-text",
  --   lazy = false,
  --   config = function()
  --     require("nvim-dap-virtual-text").setup()
  --   end,
  -- },
  -- { "rcarriga/nvim-dap-ui",
  --   dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
  --   lazy = false,
  --   config = function()
  --     local dap, dapui = require("dap"), require("dapui")
  --
  --     dapui.setup()
  --     dap.listeners.before.attach.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.launch.dapui_config = function()
  --       dapui.open()
  --     end
  --     -- dap.listeners.before.event_terminated.dapui_config = function()
  --     --   dapui.close()
  --     -- end
  --     -- dap.listeners.before.event_exited.dapui_config = function()
  --     --   dapui.close()
  --     -- end
  --   end,
  -- },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4
        }
      })
    end,
    lazy = false,
  },
  {
    'gelguy/wilder.nvim',
    lazy = false,
    config = function()
      local wilder = require('wilder')
      wilder.setup({modes = {':', '/', '?'}})

      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline(),
          wilder.search_pipeline()
        ),
      })

      wilder.set_option('renderer', wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
      }))
    end,
  },
  {
    'chentoast/marks.nvim',
    lazy = false,
    config = function()
      require'marks'.setup {
        -- whether to map keybinds or not. default true
        default_mappings = true,
        -- which builtin marks to show. default {}
        builtin_marks = { ".", "<", ">", "^" },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions. 
        -- higher values will have better performance but may cause visual lag, 
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- disables mark tracking for specific buftypes. default {}
        excluded_buftypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = "⚑",
          virt_text = "hello world",
          -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
          -- defaults to false.
          annotate = false,
        },
        mappings = {}
      }
    end,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      -- local leap = require('leap')
      -- leap.setup({})
      -- leap.create_default_mappings()
      vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
      vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
      vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
    end
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
