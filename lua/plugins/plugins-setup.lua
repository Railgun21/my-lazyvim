local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.notify("Installing lazy.nvim...", vim.log.levels.INFO)
  -- 使用字符串命令，在 Windows 下更可靠
  local cmd = string.format(
    'git clone --filter=blob:none --branch=stable "https://github.com/folke/lazy.nvim.git" "%s"',
    lazypath
  )
  vim.fn.system(cmd)
  
  -- 检查是否真的安装成功
  if not vim.loop.fs_stat(lazypath) then
    error("Failed to install lazy.nvim. Please check your Git installation and network.")
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  },
  defaults = { lazy = true, version = false },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})