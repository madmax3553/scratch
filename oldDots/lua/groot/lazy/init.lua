-- require('lazy.neorg')
return {
    { "nvim-lua/plenary.nvim", name = "plenary" },
    { "feline-nvim/feline.nvim", name = "feline"},
    print("Hello"),
    { "theprimeagen/harpoon", branch = "harpoon2", dependencies = "nvim-lua/plenary.nvim"},
    { "nvim-tree/nvim-web-devicons"},
    { "lewis6991/gitsigns.nvim"},
    print("Hello"),
    { "Mofiqul/dracula.nvim", name = "dracula", disable_backgroud = true},-- opts = {colorscheme = "dracula"}},
    -- { "nvim-neorg/neorg", ft = "norg", opts = { load = { ["core.defaults"] = {}}}}
    -- { "LazyVim/LazyVim",},
    -- { "nvim-neorg/neorg", lazy = false, version = "*", config = true,},
    { "vhyrro/luarocks.nvim", priority = 1000, config = true,},
    print("Hello"),
    --{ "nvimdev/dashboard-nvim",
      --  name = "dashboard",
        --theme = 'hyper',
       -- event = 'VimEnter',
       -- config = function()
         --   require('dashboard').setup {
           -- }
        --end,
        --dependencies = {{'nvim-tree/nvim-web-devicons'}},
   -- },
    print("Hello"),
}
