return {
  {
    "neovim/nvim-lspconfig",
    enable = false,
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = {"cpp","c","h","hpp"},
      },
    },
    config = function()
      require("lspconfig").clangd.setup
      {
        on_attach = on_attach
      }
    end,
  }
}

