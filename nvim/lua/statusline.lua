local mode_map = {
	['n'] = ' Normal ',
	['no'] = 'n·operator pending ',
	['v']  = ' Visual ',
	['V']  = ' Visual Line ',
	['']  = ' Visual Block ',
	['s']  = ' Select ',
	['S']  = ' Select Line ',
	['']  = ' Select Blocl ',
	['i']  = ' Insert ',
	['R']  = ' Replace ',
	['Rv'] = ' Visual Replace ',
	['c'] = ' Command ',
	['cv'] = ' Vim Ex ',
	['ce'] = ' Ex ',
	['r'] = ' Prompt ',
	['rm'] = ' More ',
	['r?'] = ' Confirm ',
	['!'] = ' Shell ',
	['t'] = ' Terminal '
}


local function mode()
	local m = vim.api.nvim_get_mode().mode
	if mode_map[m] == nil then return m end
	return mode_map[m]
end

vim.api.nvim_exec(
[[
  hi PrimaryBlock   ctermfg=06 ctermbg=00 guifg=#FF7733
  hi SecondaryBlock ctermfg=05 ctermbg=00
  hi Blanks   ctermfg=07 ctermbg=00
]], false)

local stl = {
  '%#PrimaryBlock#',
  mode(),
  '%#SecondaryBlock#',
  '%#Blanks#',
  '%<%f %m',
  '%=',
  '%#SecondaryBlock#',
  '%{&filetype} ',
  '%#PrimaryBlock#',
  'Ln %l, Col %c ',
}

vim.o.statusline = table.concat(stl)