return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {
          "go",
          "lua",
          "rust",
          "typescript",
          "javascript",
          "regex",
          "markdown",
          "markdown_inline",
          "json"
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region" },
              ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region" },

              ["a:"] = {
                query = "@parameter.outer",
                desc = "Select outer part of a parameter/field region",
              },
              ["i:"] = {
                query = "@parameter.inner",
                desc = "Select inner part of a parameter/field region",
              },

              ["ai"] = {
                query = "@conditional.outer",
                desc = "Select outer part of a conditional region",
              },
              ["ii"] = {
                query = "@conditional.inner",
                desc = "Select inner part of a conditional region",
              },

              ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },
              ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },

              ["ab"] = { query = "@block.outer", desc = "Select outer part of a block region" }, -- overrides default text object block of parenthesis to parenthesis
              ["ib"] = { query = "@block.inner", desc = "Select inner part of a block region" }, -- overrides default text object block of parenthesis to parenthesis

              ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
              ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },

              ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            },
            include_surrounding_whitespace = true,
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
}
