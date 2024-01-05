-- Conky, a system monitor https://github.com/brndnmtthws/conky
--
-- This configuration file is Lua code. You can write code in here, and it will
-- execute when Conky loads. You can use it to generate your own advanced
-- configurations.
--
-- Try this (remove the `--`):
--
--   print("Loading Conky config")
-- For more on Lua, see:
-- https://www.lua.org/pil/contents.html

conky.config = {
  alignment = 'bottom_right',
  background = true,
  border_width = 1,
  cpu_avg_samples = 2,
  default_color = 'BF4040',
  default_outline_color = 'white',
  default_shade_color = 'white',
  double_buffer = true,
  draw_borders = false,
  draw_graph_borders = true,
  draw_outline = false,
  draw_shades = false,
  extra_newline = false,
  font = 'Unutterable-Italic:size=20',
  gap_x = 20,
  gap_y = 35,
  minimum_height = 260,
  minimum_width = 5,
  maximum_width = 700,
  net_avg_samples = 2,
  no_buffers = true,
  out_to_console = false,
  out_to_ncurses = false,
  out_to_stderr = false,
  out_to_x = true,
  own_window = true,
  own_window_class = 'Conky',
  own_window_type = 'override',
  own_window_transparent = true,
  show_graph_range = false,
  show_graph_scale = false,
  stippled_borders = 0,
  update_interval = 1.0,
  uppercase = false,
  use_spacer = 'none',
  use_xft = true,

  lua_load = '~/.config/conky/get_quote.lua',
}

conky.text = [[
${lua get_quote}
]]
