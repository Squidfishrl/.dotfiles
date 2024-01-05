return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.note-taking.neorg", enabled = true },
  { import = "astrocommunity.bars-and-lines.lualine-nvim", enabled = true },
  {
    "lualine.nvim",
    name = "lualine",
    config = function()
      require("lualine").setup {
        options = {
          theme = "auto",
        }
      }
    end
  },
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup {
        backend = "kitty"
      }
    end
  },
  { import = "astrocommunity.color.ccc-nvim", enabled=true },
  { import = "astrocommunity.color.headlines-nvim", enabled=true },
  { import = "astrocommunity.color.transparent-nvim", enabled=true },
  { import = "astrocommunity.color.twilight-nvim", enabled=true },
  { import = "astrocommunity.color.vim-highlighter", enabled=true },
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
