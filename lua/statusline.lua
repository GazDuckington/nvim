local mode_map = {
  ['n']    = 'NOR',
  ['no']   = 'OPN',
  ['nov']  = 'OPN',
  ['noV']  = 'OPN',
  ['no�'] = 'OPN',
  ['niI']  = 'NOR',
  ['niR']  = 'NOR',
  ['niV']  = 'NOR',
  ['nt']   = 'NOR',
  ['v']    = 'VIS',
  ['vs']   = 'VIS',
  ['V']    = 'VLI',
  ['Vs']   = 'VLI',
  ['�']   = 'VBL',
  ['�s']  = 'VBL',
  ['s']    = 'SEL',
  ['S']    = 'SLI',
  ['�']   = 'SBL',
  ['i']    = 'INS',
  ['ic']   = 'INS',
  ['ix']   = 'INS',
  ['R']    = 'REP',
  ['Rc']   = 'REP',
  ['Rx']   = 'REP',
  ['Rv']   = 'VRP',
  ['Rvc']  = 'VRP',
  ['Rvx']  = 'VRP',
  ['c']    = 'CMD',
  ['cv']   = 'EX',
  ['ce']   = 'EX',
  ['r']    = 'REP',
  ['rm']   = 'MORE',
  ['r?']   = 'CONF',
  ['!']    = 'SH',
  ['t']    = 'TER',
}

require('lualine').setup({
  sections = {
    lualine_a = {function ()
        return mode_map[vim.api.nvim_get_mode().mode] or "__"
    end},
    lualine_b = {'branch'},
    lualine_c = {
		  {
		  'filename',
		  file_status = true,
		  newfile_status = true,
		  path = 3,
		  }
		},
    lualine_x = {'diagnostics', 'diff'},
    lualine_y = { 'filetype'},
    lualine_z = { 'location', 'progress' },
  },
  options = {
    theme = "catppuccin",
    global_status = true,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
})
