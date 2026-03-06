return {pkgs={{dir="/Users/rrmartins/.local/share/nvim/lazy/noice.nvim",name="noice.nvim",source="lazy",spec=function()
return {
  -- nui.nvim can be lazy loaded
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
  },
}

end,file="lazy.lua",},{dir="/Users/rrmartins/.local/share/nvim/lazy/plenary.nvim",name="plenary.nvim",source="lazy",spec={"nvim-lua/plenary.nvim",lazy=true,},file="community",},{dir="/Users/rrmartins/.local/share/nvim/lazy/telescope.nvim",name="telescope.nvim",source="rockspec",spec={"telescope.nvim",build=false,specs={{"nvim-lua/plenary.nvim",lazy=true,},},},file="telescope.nvim-scm-1.rockspec",},},version=12,}