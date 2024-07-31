-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- 最初からフルスクリーンで起動
--local mux = wezterm.mux
--wezterm.on("gui-startup", function(cmd)
--    local tab, pane, window = mux.spawn_window(cmd or {})
--    window:gui_window():toggle_fullscreen()
--end)

-- colors
config.color_scheme = "nord"
config.window_background_opacity = 0.93
-- font
-- config.font = wezterm.font("Firge35Nerd Console")
config.font_size = 13.0

-- keybinds
-- デフォルトのkeybindを無効化
config.disable_default_key_bindings = true
-- `keybinds.lua`を読み込み
local keybind = require 'keybinds'
-- keybindの設定
config.keys = keybind.keys
config.key_tables = keybind.key_tables
-- Leaderキーの設定
config.leader = { key = ",", mods = "CTRL", timeout_milliseconds = 2000 }


config.window_decorations='RESIZE'

-- and finally, return the configuration to wezterm
return config
