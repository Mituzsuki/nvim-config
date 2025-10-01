local function has_exec(exec)
  return vim.fn.executable(exec) == 1
end

local required = {
  { "dotnet", "Please install the .NET SDK (dotnet)." },
  { "rg", "Install ripgrep (rg) for Telescope live_grep." },
  { "fd", "Install fd for better file searching." },
}

local has_missing = false;

for _, dep in ipairs(required) do
  if not has_exec(dep[1]) then
    has_missing = true;
    vim.notify("Missing dependency: " .. dep[1] .. "\n" .. dep[2], vim.log.levels.WARN)
  end
end

if(has_missing) then
 local sys = vim.loop.os_uname().sysname;
 if(sys == 'Windows_NT') then
  print("Run bootstrap.ps1 to ensure deps installed.")
 else
  print("Run bootstrap.sh to ensure deps installed.")
 end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.number = true

vim.opt.clipboard = "unnamedplus"

require("vim-options")
require("lazy").setup("plugins")
local function print_plugins()
  local plugins = require("lazy").plugins()
  for _, plugin in pairs(plugins) do
    if plugin.url ~= nil then
      print(plugin.url .. "\n")
    end
  end
end

-- print_plugins()
