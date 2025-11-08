-- Remove Statusline background color
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("StatuslineOverrides", { clear = true }),
  callback = function()
    vim.cmd(":hi StatusLine guibg=NONE ctermbg=NONE")
    vim.cmd(":hi StatusLineNC guibg=NONE ctermbg=NONE")
    vim.cmd(":hi StatusLineTerm guibg=NONE ctermbg=NONE")
    vim.cmd(":hi StatusLineTermNC guibg=NONE ctermbg=NONE")
  end,
})

-- Display current Vim mode
local function get_current_mode()
  local mode = vim.api.nvim_get_mode().mode
  local mode_map = {
    -- NORMAL
    ["n"]     = { name = "NORMAL", hl = "MiniStatuslineModeNormal" },
    ["no"]    = { name = "O-PENDING", hl = "MiniStatuslineModeNormal" },
    ["nov"]   = { name = "O-PENDING", hl = "MiniStatuslineModeNormal" },
    ["noV"]   = { name = "O-PENDING", hl = "MiniStatuslineModeNormal" },
    ["no\22"] = { name = "O-PENDING", hl = "MiniStatuslineModeNormal" },
    ["niI"]   = { name = "NORMAL", hl = "MiniStatuslineModeNormal" },
    ["niR"]   = { name = "NORMAL", hl = "MiniStatuslineModeNormal" },
    ["niV"]   = { name = "NORMAL", hl = "MiniStatuslineModeNormal" },
    ["nt"]    = { name = "NORMAL", hl = "MiniStatuslineModeNormal" },
    ["ntT"]   = { name = "NORMAL", hl = "MiniStatuslineModeNormal" },

    -- VISUAL
    ["v"]     = { name = "VISUAL", hl = "MiniStatuslineModeVisual" },
    ["vs"]    = { name = "VISUAL", hl = "MiniStatuslineModeVisual" },
    ["V"]     = { name = "V-LINE", hl = "MiniStatuslineModeVisual" },
    ["Vs"]    = { name = "V-LINE", hl = "MiniStatuslineModeVisual" },
    ["\22"]   = { name = "V-BLOCK", hl = "MiniStatuslineModeVisual" },
    ["\22s"]  = { name = "V-BLOCK", hl = "MiniStatuslineModeVisual" },
    ["s"]     = { name = "SELECT", hl = "MiniStatuslineModeVisual" },
    ["S"]     = { name = "S-LINE", hl = "MiniStatuslineModeVisual" },
    ["\19"]   = { name = "S-BLOCK", hl = "MiniStatuslineModeVisual" },

    -- INSERT
    ["i"]     = { name = "INSERT", hl = "MiniStatuslineModeInsert" },
    ["ic"]    = { name = "INSERT", hl = "MiniStatuslineModeInsert" },
    ["ix"]    = { name = "INSERT", hl = "MiniStatuslineModeInsert" },

    -- REPLACE
    ["r"]     = { name = "REPLACE", hl = "MiniStatuslineModeReplace" },
    ["Rc"]    = { name = "REPLACE", hl = "MiniStatuslineModeReplace" },
    ["Rx"]    = { name = "REPLACE", hl = "MiniStatuslineModeReplace" },
    ["Rv"]    = { name = "V-REPLACE", hl = "MiniStatuslineModeReplace" },
    ["Rvc"]   = { name = "V-REPLACE", hl = "MiniStatuslineModeReplace" },
    ["Rvx"]   = { name = "V-REPLACE", hl = "MiniStatuslineModeReplace" },

    -- COMMAND
    ["c"]     = { name = "COMMAND", hl = "MiniStatuslineModeCommand" },
    ["cv"]    = { name = "EX", hl = "MiniStatuslineModeCommand" },
    ["ce"]    = { name = "EX", hl = "MiniStatuslineModeCommand" },

    -- TERMINAL & OTHER
    ["t"]     = { name = "TERMINAL", hl = "MiniStatuslineModeOther" },
    ["!"]     = { name = "SHELL", hl = "MiniStatuslineModeOther" },
    ["rm"]    = { name = "MORE", hl = "MiniStatuslineModeOther" },
    ["r?"]    = { name = "CONFIRM", hl = "MiniStatuslineModeOther" },
  }

  local data = mode_map[mode] or { name = " " .. mode:upper() .. " ", hl = "StatusLine" }

  -- Format: %#HIGHLIGHT_GROUP# MODE %*
  return "%#" .. data.hl .. "# " .. data.name .. " %*"
end
_G.get_current_mode = get_current_mode

-- Layout Statusline
vim.opt.laststatus = 2
vim.opt.statusline = [[%{%v:lua.get_current_mode()%} %t %m]]
