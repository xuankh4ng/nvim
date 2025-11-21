-- Custom highlight groups
vim.cmd(":hi StatusLine guibg=NONE ctermbg=NONE")
vim.cmd(":hi StatusLineNC guibg=NONE ctermbg=NONE")
vim.cmd(":hi StatusLineTerm guibg=NONE ctermbg=NONE")
vim.cmd(":hi StatusLineTermNC guibg=NONE ctermbg=NONE")

vim.api.nvim_set_hl(0, "GitBar", { bg = "#E69875" })
vim.api.nvim_set_hl(0, "GitBranch", { fg = "#E69875", bg = "#374145", bold = true })
vim.api.nvim_set_hl(0, "GitAdd", { fg = "#A7C080", bg = "#374145", bold = true })
vim.api.nvim_set_hl(0, "GitChange", { fg = "#7FBBB3", bg = "#374145", bold = true })
vim.api.nvim_set_hl(0, "GitDelete", { fg = "#E67E80", bg = "#374145", bold = true })

vim.api.nvim_set_hl(0, "LspBar", { bg = "#83C092" })
vim.api.nvim_set_hl(0, "LspStatus", { fg = "#83C092", bg = "#374145", bold = true })
vim.api.nvim_set_hl(0, "LspDiagnosticsError", { fg = "#E67E80" })
vim.api.nvim_set_hl(0, "LspDiagnosticsWarning", { fg = "#DBBC7F" })
vim.api.nvim_set_hl(0, "LspDiagnosticsHint", { fg = "#D699B6" })
vim.api.nvim_set_hl(0, "LspDiagnosticsInfo", { fg = "#7FBBB3" })

-- Git
local GIT_CACHE = {
  output = "",
}

local function update_git()
  local status_output = ""
  local git_branch = vim.fn.system({ "git", "branch", "--show-current" }):gsub("[\r\n]", "")
  local git_status_list = vim.fn.systemlist({ "git", "status", "--porcelain=v1" })

  local staged_count = 0 -- Staged (A, M, R, C in X column)
  local modified = 0     -- Unstaged modified (M in X column)
  local deleted = 0      -- Unstaged deleted (D in X column)
  local untracked = 0    -- Untracked (??)

  for _, line in ipairs(git_status_list) do
    local status_xy = line:sub(1, 2)
    local staged = status_xy:sub(1, 1)
    local working = status_xy:sub(2, 2)

    -- Staged Changes
    if staged ~= " " and staged ~= "?" and staged ~= "!" then
      staged_count = staged_count + 1
    end

    -- Unstaged Changes
    if working == "M" and staged == " " then
      modified = modified + 1
    elseif working == "D" and staged == " " then
      deleted = deleted + 1
    elseif status_xy == "??" then
      untracked = untracked + 1
    end
  end

  local unstaged_mod = modified + untracked

  if git_branch ~= "" and not git_branch:match("^fatal:") then
    status_output = "%#GitBar# %*%#GitBranch# " .. git_branch .. " %*"

    if staged_count > 0 then
      status_output = status_output .. "%#GitAdd# " .. staged_count .. " %*"
    end
    if unstaged_mod > 0 then
      status_output = status_output .. "%#GitChange# " .. unstaged_mod .. " %*"
    end
    if deleted > 0 then
      status_output = status_output .. "%#GitDelete# " .. deleted .. " %*"
    end
  end

  GIT_CACHE.output = status_output
  vim.cmd("redrawstatus")
end

local function get_git()
  return GIT_CACHE.output
end

_G.get_git = get_git
_G.update_git = update_git

update_git()

vim.api.nvim_create_autocmd({ "BufWritePost", "DirChanged", "FocusGained" }, {
  group = vim.api.nvim_create_augroup("GitBranchUpdate", { clear = true }),
  callback = _G.update_git,
})

-- Diagnostics
local function get_diagnostics()
  local diagnostics = vim.diagnostic.get(0)
  if not diagnostics or #diagnostics == 0 then
    return ""
  end

  local error_count = 0
  local warning_count = 0
  local hint_count = 0
  local info_count = 0

  for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.severity == vim.diagnostic.severity.ERROR then
      error_count = error_count + 1
    elseif diagnostic.severity == vim.diagnostic.severity.WARN then
      warning_count = warning_count + 1
    elseif diagnostic.severity == vim.diagnostic.severity.HINT then
      hint_count = hint_count + 1
    elseif diagnostic.severity == vim.diagnostic.severity.INFO then
      info_count = info_count + 1
    end
  end

  local output = ""

  if error_count > 0 then
    output = output .. "%#LspDiagnosticsError# " .. error_count .. " %*"
  end
  if warning_count > 0 then
    output = output .. "%#LspDiagnosticsWarning# " .. warning_count .. " %*"
  end
  if hint_count > 0 then
    output = output .. "%#LspDiagnosticsHint#󰠠 " .. hint_count .. " %*"
  end
  if info_count > 0 then
    output = output .. "%#LspDiagnosticsInfo#󰋼 " .. info_count .. " %*"
  end

  return output
end
_G.get_diagnostics = get_diagnostics

vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
  group = vim.api.nvim_create_augroup("DiagnosticsUpdate", { clear = true }),
  callback = function()
    vim.cmd("redrawstatus")
  end,
})

-- LSP
local function lsp_status_short()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if #clients == 0 then
    return ""
  end

  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end

  return "%#LspStatus# " .. table.concat(names, ", ") .. " %*%#LspBar# %*"
end
_G.lsp_status_short = lsp_status_short


vim.opt.laststatus = 2
vim.opt.statusline = "%{%v:lua.get_git()%}"
    .. " %t %m"
    .. "%="
    .. "%{%v:lua.get_diagnostics()%}"
    .. "%{%v:lua.lsp_status_short()%}"
