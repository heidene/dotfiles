local wezterm = require 'wezterm'

-- local catppucinno = wezterm.color.get_builtin_schemes()["Catppuccin Macchiato"]

local title_color_bg = wezterm.color.parse("#24273a")
local title_color_fg = wezterm.color.parse("#cad3f5")

local color_off = title_color_bg:lighten(0.4)
local color_on = color_off:lighten(0.4)
wezterm.on('update-right-status', function(window)
	local bat = ''
	local b = wezterm.battery_info()[1]
	bat = wezterm.format {
		{
			Foreground = {
				Color =
				    b.state_of_charge > 0.2 and color_on or color_off,
			}
		},
		{ Text = '▉' },
		{
			Foreground = {
				Color =
				    b.state_of_charge > 0.4 and color_on or color_off,
			}
		},
		{ Text = '▉' },
		{
			Foreground = {
				Color =
				    b.state_of_charge > 0.6 and color_on or color_off,
			}
		},
		{ Text = '▉' },
		{
			Foreground = {
				Color =
				    b.state_of_charge > 0.8 and color_on or color_off,
			}
		},
		{ Text = '▉' },
		{
			Background = {
				Color =
				    b.state_of_charge > 0.98 and color_on or color_off,
			}
		},
		{
			Foreground = {
				Color =
				    b.state == "Charging"
				    and color_on:lighten(0.3):complement()
				    or
				    (b.state_of_charge < 0.2 and wezterm.GLOBAL.count % 2 == 0)
				    and color_on:lighten(0.1):complement()
				    or color_off:darken(0.1)
			}
		},
		{ Text = ' ⚡ ' },
	}

	local time = wezterm.strftime '%-l:%M %P'

	local bg1 = title_color_bg:lighten(0.1)
	local bg2 = title_color_bg:lighten(0.2)

	window:set_right_status(
		wezterm.format {
			{ Background = { Color = title_color_bg } },
			{ Foreground = { Color = bg1 } },
			{ Text = '' },
			{ Background = { Color = title_color_bg:lighten(0.1) } },
			{ Foreground = { Color = title_color_fg } },
			{ Text = ' ' .. window:active_workspace() .. ' ' },
			{ Foreground = { Color = bg1 } },
			{ Background = { Color = bg2 } },
			{ Text = '' },
			{ Foreground = { Color = title_color_bg:lighten(0.4) } },
			{ Foreground = { Color = title_color_fg } },
			{ Text = ' ' .. time .. ' ' .. bat }
		}
	)
end)

wezterm.on('gui-startup', function(cmd)
	local mux = wezterm.mux

	local padSize = 80
	local screenWidth = 2560
	local screenHeight = 1600

	local tab, pane, window = mux.spawn_window(cmd or {
		workspace = 'main',
	})

	local icons = {
		'🌞',
		'🍧',
		'🫠',
		'🏞️',
		'📑',
		'🪁',
		'🧠',
		'🦥',
		'🦉',
		'📀',
		'🌮',
		'🍜',
		'🧋',
		'🥝',
		'🍊',
	}

	tab:set_title('  ' .. icons[math.random(#icons)] .. '  ')

	if window ~= nil then
		window:gui_window():set_position(padSize, padSize)
		window:gui_window():set_inner_size(screenWidth - (padSize * 2), screenHeight - (padSize * 2) - 48)
	end
end)

local TAB_EDGE_LEFT = wezterm.nerdfonts.ple_left_half_circle_thick
local TAB_EDGE_RIGHT = wezterm.nerdfonts.ple_right_half_circle_thick

local function tab_title(tab_info)
	local title = tab_info.tab_title

	if title and #title > 0 then return title end

	return tab_info.active_pane.title:gsub("%.exe", "")
end

wezterm.on(
	'format-tab-title',
	function(tab, _, _, _, hover, max_width)
		local edge_background = title_color_bg
		local background = title_color_bg:lighten(0.05)
		local foreground = title_color_fg

		if tab.is_active then
			background = background:lighten(0.1)
			foreground = foreground:lighten(0.1)
		elseif hover then
			background = background:lighten(0.2)
			foreground = foreground:lighten(0.2)
		end

		local edge_foreground = background

		local title = tab_title(tab)

		-- ensure that the titles fit in the available space,
		-- and that we have room for the edges.
		title = wezterm.truncate_right(title, max_width - 2)

		return {
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = TAB_EDGE_LEFT },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = title },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = TAB_EDGE_RIGHT },
		}
	end
)

function SetupKeys()
	local act = wezterm.action
	local keys = {
		{ key = '[', mods = 'ALT', action = act.ActivateTabRelative(-1) },
		{ key = ']', mods = 'ALT', action = act.ActivateTabRelative(1) },
    {
      key = 'W',
      mods = 'CTRL|SHIFT',
      action = act.PromptInputLine {
        description = wezterm.format {
          { Attribute = { Intensity = 'Bold' } },
          { Foreground = { AnsiColor = 'Fuchsia' } },
          { Text = 'Enter name for new workspace' },
        },
        action = wezterm.action_callback(function(window, pane, line)
          -- line will be `nil` if they hit escape without entering anything
          -- An empty string if they just hit enter
          -- Or the actual line of text they wrote
          if line then
            window:perform_action(
              act.SwitchToWorkspace {
                name = line,
              },
              pane
            )
          end
        end),
      },
    },
    {
      key = '9',
      mods = 'ALT',
      action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
    },
    { key = 'l', mods = 'CTRL', action = act.SwitchWorkspaceRelative(1) },
    { key = 'h', mods = 'CTRL', action = act.SwitchWorkspaceRelative(-1) },
    {
      key = 'h',
      mods = 'CTRL|SHIFT|ALT',
      action = wezterm.action.SplitPane {
        direction = 'Left',
        size = { Percent = 50 },
      },
    },
    {
      key = 'j',
      mods = 'CTRL|SHIFT|ALT',
      action = wezterm.action.SplitPane {
        direction = 'Down',
        size = { Percent = 50 },
      },
    },
    {
      key = 'k',
      mods = 'CTRL|SHIFT|ALT',
      action = wezterm.action.SplitPane {
        direction = 'Up',
        size = { Percent = 50 },
      },
    },
    {
      key = 'l',
      mods = 'CTRL|SHIFT|ALT',
      action = wezterm.action.SplitPane {
        direction = 'Right',
        size = { Percent = 50 },
      },
    },
    {
      key = 'w',
      mods = 'CTRL|SHIFT|ALT',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
      key = 's',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'g',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'K',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'J',
      mods = 'CTRL|SHIFT',
      action = act.ActivatePaneDirection 'Down',
    },
    {
      key = 'h',
      mods = 'CMD|ALT',
      action = act.AdjustPaneSize { 'Left', 5 },
    },
    {
      key = 'j',
      mods = 'CMD|ALT',
      action = act.AdjustPaneSize { 'Down', 5 },
    },
    {
      key = 'k',
      mods = 'CMD|ALT',
      action = act.AdjustPaneSize { 'Up', 5 } },
    {
      key = 'l',
      mods = 'CMD|ALT',
      action = act.AdjustPaneSize { 'Right', 5 },
    },
	}

	for i = 1, 8 do
		-- CTRL+ALT + number to activate that tab
		table.insert(keys, {
			key = tostring(i),
			mods = 'CTRL|ALT',
			action = act.ActivateTab(i - 1),
		})
		-- F1 through F8 to activate that tab
		table.insert(keys, {
			key = 'F' .. tostring(i),
			action = act.ActivateTab(i - 1),
		})
	end

	return keys;
end

return {
	colors = {
		tab_bar = {
			active_tab = {
				bg_color = title_color_bg:lighten(0.03),
				fg_color = title_color_fg:lighten(0.8),
				intensity = "Bold",
			},
			inactive_tab = {
				bg_color = title_color_bg:lighten(0.01),
				fg_color = title_color_fg,
				intensity = "Half",
			},
			inactive_tab_edge = title_color_bg
		},
		split = title_color_bg:lighten(0.3):desaturate(0.5)
	},
	color_scheme = "Catppuccin Macchiato",
	window_background_opacity = 0.6,
	window_frame = {
		active_titlebar_bg = title_color_bg,
		inactive_titlebar_bg = title_color_bg,
		font_size = 12.0,
	},
	font = wezterm.font_with_fallback {
		'Cascadia Code PL',
	},
	window_decorations = 'RESIZE',
	macos_window_background_blur = 20,
	show_tab_index_in_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	keys = SetupKeys(),
  launch_menu = {
    {
      args = { 'top' },
    },
    {
      -- Optional label to show in the launcher. If omitted, a label
      -- is derived from the `args`
      label = 'Bash',
      -- The argument array to spawn.  If omitted the default program
      -- will be used as described in the documentation above
      args = { 'bash', '-l' },

      -- You can specify an alternative current working directory;
      -- if you don't specify one then a default based on the OSC 7
      -- escape sequence will be used (see the Shell Integration
      -- docs), falling back to the home directory.
      -- cwd = "/some/path"

      -- You can override environment variables just for this command
      -- by setting this here.  It has the same semantics as the main
      -- set_environment_variables configuration option described above
      -- set_environment_variables = { FOO = "bar" },
    },
  }
}
