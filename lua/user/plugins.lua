local gitsigns = {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup {
      signs                        = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '-' },
        topdelete    = { text = '‾' },
        changedelete = { text = '_' },
        untracked    = { text = '┆' },
      },
      signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir                 = {
        follow_files = true
      },
      attach_to_untracked          = true,
      current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority                = 6,
      update_debounce              = 100,
      status_formatter             = nil,   -- Use default
      max_file_length              = 40000, -- Disable if file is longer than this (in lines)
      preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      yadm                         = {
        enable = false
      },
    }
  end
}

lvim.plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestions = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },

  { 'jose-elias-alvarez/typescript.nvim' },

  { 'lunarvim/lunar.nvim' },
  { "morhetz/gruvbox" },
  { "sainnhe/gruvbox-material" },
  { "sainnhe/sonokai" },
  { "sainnhe/edge" },
  { "lunarvim/horizon.nvim" },
  { "tomasr/molokai" },
  { "ayu-theme/ayu-vim" },

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },

  { "tpope/vim-surround" },
  { "felipec/vim-sanegx", event = "BufRead" },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "tpope/vim-repeat" },

  { "ThePrimeagen/harpoon" },

  -- {
  --   'phaazon/hop.nvim',
  --   branch = 'v2',
  --   config = function()
  --     require('hop').setup()
  --   end
  -- },

  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
  },

  {
    'AckslD/nvim-trevJ.lua',
    config = 'require("trevj").setup()',
    init = function()
      vim.keymap.set('n', '<leader>j', function()
        require('trevj').format_at_cursor()
      end)
    end,
  },

  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup({})
      local map = vim.api.nvim_set_keymap
      local default_options = { noremap = true, silent = true }
      -- tmux navigation
      map("n", "<C-h>", "<cmd>lua require('Navigator').left()<CR>", default_options)
      map("n", "<C-k>", "<cmd>lua require('Navigator').up()<CR>", default_options)
      map("n", "<C-l>", "<cmd>lua require('Navigator').right()<CR>", default_options)
      map("n", "<C-j>", "<cmd>lua require('Navigator').down()<CR>", default_options)
    end,
  },

  {
    "ggandor/flit.nvim",
    keys = function()
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },

  {
    "ggandor/leap.nvim",
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  -- coq, not configured properly
  -- {
  --   "ms-jpq/coq_nvim",
  --   branch = "coq",
  --   dependencies = {
  --     {
  --       "ms-jpq/coq.artifacts",
  --       branch = "artifacts",
  --     },
  --     {
  --       "ms-jpq/coq.thirdparty",
  --       branch = "3p",
  --     },
  --   },
  -- },

  -- {
  --   "kevinhwang91/nvim-ufo",
  --   event = "BufRead",
  --   dependencies = {
  --     { "kevinhwang91/promise-async" },
  --     { "luukvbaal/statuscol.nvim" },
  --   },
  --   config = function()
  --     require("ufo").setup({
  --       close_fold_kinds = { "imports" },
  --       provider_selector = function(bufnr, filetype, buftype)
  --         -- if you prefer treesitter provider rather than lsp,
  --         -- return ftMap[filetype] or {'treesitter', 'indent'}

  --         -- refer to ./doc/example.lua for detail
  --         return "treesitter"
  --       end
  --     })
  --     vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
  --     vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
  --     vim.keymap.set("n", "zk", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
  --     vim.keymap.set("n", "zK", function()
  --       local winid = require("ufo").peekFoldedLinesUnderCursor()
  --       if not winid then
  --         vim.lsp.buf.hover()
  --       end
  --     end, { desc = "Peek folded lines under cursor" })
  --   end,
  -- },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = false,
        ft_ignore = { "neo-tree" },
        segments = {
          {
            -- line number
            text = { builtin.lnumfunc },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          { text = { "%s" },      click = "v:lua.ScSa" }, -- Sign
          { text = { "%C", " " }, click = "v:lua.ScFa" }, -- Fold
        },
      })
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        callback = function()
          if vim.bo.filetype == "neo-tree" then
            vim.opt_local.statuscolumn = ""
          end
        end,
      })
    end,
  },

  {
    "m4xshen/smartcolumn.nvim",
    opts = {}
  },

  { 'Mofiqul/dracula.nvim' },

  { "EdenEast/nightfox.nvim" },

  { "rebelot/kanagawa.nvim" },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require 'rainbow-delimiters'

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },

  {
    "AckslD/muren.nvim",
    cmd = {
      "MurenOpen",
      "MurenClose",
      "MurenToggle",
      "MurenFresh",
      "MurenUnique"
    },
    config = function()
      require("muren").setup({
        keys = {
          toggle_options_focus = "<C-o>",
          scroll_preview_up = "<C-b>",
          scroll_preview_down = "<C-f>"
        },
        hl = {
          options = {
            on = "DiagnosticOk",
            off = "DiagnosticError"
          },
          preview = {
            cwd = {
              path = "Directory",
              lnum = "LineNr"
            }
          },
        },
      })
    end,
  },

  {
    "mg979/vim-visual-multi",
    event = "BufAdd",
  },

  {
    "simrat39/symbols-outline.nvim",
    opts = {
      -- Depth past which nodes will be folded by default
      autofold_depth = 1,
    },
    keys = {
      { "<leader>tO", "<cmd>SymbolsOutline<cr>", desc = "Toggle SymbolsOutline" },
    },
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require('notify')
      vim.notify = notify
      lvim.notify = notify
    end
  },

  {
    "folke/noice.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
      "MunifTanjim/nui.nvim"
    },
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { icon = "  " },
          search_down = { icon = "  󰄼" },
          search_up = { icon = "  " },
          lua = { icon = "  " },
        },
      },

      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },

      lsp = {
        progress = { enabled = true },
        hover = { enabled = false },
        signature = { enabled = false },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            find = "%d+L, %d+B",
          },
        },
      },
    },

    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim",        -- optional
      },
      config = function()
        require('noice').setup({})
      end
    }
  },

  -- ui components
  { "MunifTanjim/nui.nvim",  lazy = true },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "junegunn/gv.vim",
    lazy = false,
  },

  {
    'echasnovski/mini.animate',
    version = false,
    config = function()
      require('mini.animate').setup({})
    end
  },

  {
    'echasnovski/mini.indentscope',
    version = false,
    config = function() require('mini.indentscope').setup() end
  },

  gitsigns,
}

table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    local ok, cmp = pcall(require, "copilot_cmp")
    if ok then cmp.setup({}) end
  end,
})

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
end
