-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
    hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")
	-- hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hyprlauncher -d")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("batsignal -w 20 -c 10 -d 5 -W 'Battery low' -C 'Battery critical' -D 'Battery danger - shutting down soon'")
end)
