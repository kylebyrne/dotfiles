launch = function(appname)
  hs.application.launchOrFocus(appname)
  k.triggered = true
end

-- Keybinding for specific single apps.

singleapps = {
  {'f', 'Arc'},
  {'t', 'Alacritty'},
  {'s', 'Slack'},
  {'p', 'Finder'},
  {'e', 'Spark'},
  {'d', 'Dash'},
  {'w', 'Todoist'},
  {'c', 'Cron'},
}

for i, app in ipairs(singleapps) do
  hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, app[1], function() launch(app[2]); k:exit(); end)
end

hs.loadSpoon("Lunette")
customBindings = {
  leftHalf = {
    {{"cmd", "alt"}, "H"},
  },
  rightHalf = {
    {{"cmd", "alt"}, "L"},
  },
  undo = false,
  redo = false
}
spoon.Lunette:bindHotkeys(customBindings)
