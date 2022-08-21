require("bufferline").setup({
  options = {
    buffer_close_icon = "",
    close_command = "bdelete! %d",
    close_icon = "",
    indicator_icon = " ",
    left_trunc_marker = "",
    modified_icon = "●",
    offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
    right_mouse_command = "bdelete! %d",
    right_trunc_marker = "",
    show_close_icon = false,
    show_tab_indicators = true,
    highlight = {
   	 fill = {
   	   guifg = { attribute = "fg", highlight = "Normal" },
   	   guibg = { attribute = "bg", highlight = "StatusLineNC" },
   	 },
   	 background = {
   	   guifg = { attribute = "fg", highlight = "Normal" },
   	   guibg = { attribute = "bg", highlight = "StatusLine" },
   	 },
   	 buffer_visible = {
   	   gui = "",
   	   guifg = { attribute = "fg", highlight = "Normal" },
   	   guibg = { attribute = "bg", highlight = "Normal" },
   	 },
   	 buffer_selected = {
   	   gui = "",
   	   guifg = { attribute = "fg", highlight = "Normal" },
   	   guibg = { attribute = "bg", highlight = "Normal" },
   	 },
   	 separator = {
   	   guifg = { attribute = "bg", highlight = "Normal" },
   	   guibg = { attribute = "bg", highlight = "StatusLine" },
   	 },
   	 separator_selected = {
   	   guifg = { attribute = "fg", highlight = "Special" },
   	   guibg = { attribute = "bg", highlight = "Normal" },
   	 },
   	 separator_visible = {
   	   guifg = { attribute = "fg", highlight = "Normal" },
   	   guibg = { attribute = "bg", highlight = "StatusLineNC" },
   	 },
   	 close_button = {
   	   guifg = { attribute = "fg", highlight = "Normal" },
   	   guibg = { attribute = "bg", highlight = "StatusLine" },
   	 },
   	 close_button_selected = {
   	   guifg = { attribute = "fg", highlight = "normal" },
   	   guibg = { attribute = "bg", highlight = "normal" },
   	 },
   	 close_button_visible = {
   	   guifg = { attribute = "fg", highlight = "normal" },
   	   guibg = { attribute = "bg", highlight = "normal" },
   	 },
    },
  },
})
