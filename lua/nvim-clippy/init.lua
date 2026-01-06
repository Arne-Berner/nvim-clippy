local clippy = require("nvim-clippy.clippy")
local vim = vim

local M = {}

M.clippy_qf = clippy.clippy_qf
M.clippy_telescope = clippy.clippy_telescope
M.clean_cache = clippy.clean_cache
M.clean_project_cache_file = clippy.clean_project_cache_file

M.setup = function()
  -- Register commands
  vim.api.nvim_create_user_command("Clip", function(opts)
    M.clippy_telescope(opts.bang)
  end, { bang = true })

  vim.api.nvim_create_user_command("ClipQF", function(opts)
    M.qf_clippy(opts.bang)
  end, { bang = true })

  vim.api.nvim_create_user_command("CleanClip", M.clean_project_cache_file, {})
  vim.api.nvim_create_user_command("CleanClipWhole", M.clean_cache, {})
end

return M
