local M = {
 "nvim-treesitter/nvim-treesitter",
 event = { "BufReadPost", "BufNewFile" },
 build = ":TSUpdate",
}

M.config = function()
 require("nvim-treesitter.configs").setup {
   ensure_installed = { "lua", "markdown", "go","c","zig","bash", "python" },
   auto_install = true,
   ignore_install = { "" },
   sync_install = false,
    highlight = {
       enable = true,
       additional_vim_regex_highlighting = false,
   },
   indent = { enable = true },
 }
end

return M
