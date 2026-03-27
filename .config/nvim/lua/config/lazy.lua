-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- skips lazyvim plugin order check
vim.g.lazyvim_check_order = false

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- dracula theme
    --{
    --  "Mofiqul/dracula.nvim",
    --  config = function()
    --    require("dracula").setup({
    --      -- optional customization
    --      transparent_bg = true,
    --      italic_comment = true,
    --    })
    --    -- set the colorscheme
    --    vim.cmd.colorscheme("dracula")
    --  end,
    --},
    -- end dracula theme

    -- my plugins (other dir)
    { import = "plugins" },

  },
})
