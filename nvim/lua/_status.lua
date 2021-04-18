local fn = vim.fn

Statusline = {}

-- highlight groups
Statusline.groups = {
  container     = '%#StatusLine#',
  mode          = '%#Mode#',
  filename      = '%#Filename#',
  git           = '%#Git#',
  filetype      = '%#Filetype#',
  position      = '%#Position#',
  blank         = '%#Blank#'
}

Statusline.mode = function()
  local modeGroups = {
    ['N'] = '%#NormalMode#',
    ['V'] = '%#VisualMode#',
    ['S'] = '%#SelectMode#',
    ['I'] = '%#InsertMode#',
    ['R'] = '%#ReplaceMode#',
    ['C'] = '%#CommandeMode#',
    ['E'] = '%#ExMode#',
    ['P'] = '%#PromptMode#',
    ['T'] = '%#TerminalMode#',
  }

  local modes = {
    ['n']  = 'N',
    ['no'] = 'N',
    ['v']  = 'V',
    ['V']  = 'V',
    ['']  = 'V',
    ['s']  = 'S',
    ['S']  = 'S',
    ['']  = 'S',
    ['i']  = 'I',
    ['R']  = 'R',
    ['Rv'] = 'V',
    ['c']  = 'C',
    ['cv'] = 'V',
    ['ce'] = 'E',
    ['r']  = 'P',
    ['rm'] = 'M',
    ['r?'] = 'C',
    ['!']  = 'T',
    ['t']  = 'T',
  }

  local mode = fn.mode()
  local currentmode = modes[mode]
  local currentmodegroup = modeGroups[currentmode]
  return string.format('%s ', currentmodegroup .. ' ' .. currentmode)
end

Statusline.filename = function()
  local modified = vim.api.nvim_buf_get_option(0, 'mod')
  local filePath = vim.fn.expand("%:f")
  if modified == true then
    return string.format(' %s * ', filePath)
  end
  return string.format(' %s ', filePath)
end

Statusline.filetype = function()
  local fileext = fn.expand("%:e")
  local filetype = vim.bo.filetype
  if filetype == '' then return '' end

  return string.format(' %s %s ', fileext, filetype):lower()
end

Statusline.position = function()
  return ' Ln %l, Col %c '
end


Statusline.build = function(self)
  local groups = self.groups

  local mode = self:mode()
  local filename = groups.filename .. self:filename()
  local filetype = groups.filetype .. self:filetype()
  local position = groups.position .. self:position()

  return table.concat({
    groups.container,
    mode,
    groups.blank,
    "%=","%=",
    filename,
    filetype, position
  })
end

Statusline.render = function() return Statusline:build() end

Statusline.colors = {
  ['red'] = '#ec5f67',
  ['orange'] = '#f99157',
  ['yellow'] = '#fac863',
  ['green'] = '#99c794',
  ['teal'] = '#62b3b2',
  ['blue'] = '#6699cc',
  ['pink'] = '#DF82C5',
  ['purple'] = '#c594c5',
  -- ['brightRed'] = '',
  -- ['brightOrange'] = '',
  -- ['brightYellow'] = '',
  -- ['brightGreen'] = '',
  -- ['brightTeal'] = '',
  -- ['brightBlue'] = '',
  -- ['brightPink'] = '',
  -- ['brightPurple'] = '',
  ['white'] = '#D8DEE9',
  ['lightGrey'] = '#C0C5CE',
  ['midGrey'] = '#A7ADBA',
  ['darkGrey'] = '#4F5B66',
  ['black'] = '#1B2B34',
}



vim.api.nvim_exec(
[[
  hi StatusLine     guifg=#D8DEE9 guibg=#1B2B34
  hi Blank          guifg=#D8DEE9 guibg=#1B2B34
  hi NormalMode     guifg=#1B2B34 guibg=#fac863
  hi VisualMode     guifg=#1B2B34 guibg=#DF82C5 gui=bold
  hi SelectMode     guifg=#1B2B34 guibg=#36A3D9 gui=bold
  hi InsertMode     guifg=#1B2B34 guibg=#fac863 gui=bold
  hi ReplaceMode    guifg=#1B2B34 guibg=#F07178 gui=bold
  hi CommandeMode   guifg=#1B2B34 guibg=#F07178 gui=bold
  hi ExMode         guifg=#1B2B34 guibg=#F07178 gui=bold
  hi PromptMode     guifg=#1B2B34 guibg=#F07178 gui=bold
  hi TerminalMode   guifg=#1B2B34 guibg=#D4BFFF gui=bold
  hi Filename       guifg=#D8DEE9 guibg=#1B2B34
  hi Git            guifg=#EBDBB2 guibg=#504945
  hi Filetype       guifg=#1B2B34 guibg=#62b3b2
  hi Position       guifg=#D8DEE9 guibg=#4F5B66 gui=bold
]], false);

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.render()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.render()
  augroup END
]], false);