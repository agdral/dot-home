{...}: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Walker
      ", $F23, exec, walker --modules applications"
      ", $F22, exec, walker --modules clipboard"
      ", $F20, exec, pkill -SIGUSR1 waybar"

      "$HyprRm, $F23, exec, systemctl restart --user walker.service"

      # Media Command
      ",XF86AudioRaiseVolume, exec, playerConf up"
      ",XF86AudioLowerVolume, exec, playerConf down"
      ",XF86AudioPlay, exec, playerConf play"
      ",XF86AudioPrev, exec, playerConf previous"
      ",XF86AudioNext, exec, playerConf next"

      # Tauon
      "$Modm, 8, exec, tauon --no-start --previous"
      "$Modm, 9, exec, tauon --no-start --next"
      "$Modm, 0, exec, tauon --no-start --play-pause"

      # Move Window
      "$Modm, left, movewindow, l"
      "$Modm, right, movewindow, r"
      "$Modm, up, movewindow, u"
      "$Modm, down, movewindow, d"

      # Move Focus
      "$Modm, R, movefocus, l"
      "$Modm, N, movefocus, r"
      "$Modm, C, movefocus, u"
      "$Modm, T, movefocus, d"

      # Move Position Group
      "$Modm, F, changegroupactive, b"
      "$Modm, L, changegroupactive, f "

      # Scroll through existing workspaces with Mod + scroll
      "$Modm, mouse_down, workspace, e+1"
      "$Modm, mouse_up, workspace, e-1"

      # Swap Window
      "$Modm, home, swapwindow, l"
      "$Modm, end, swapwindow, r"

      # Modify Window
      "$Modm, D, killactive, "
      "$Modm, S, togglefloating, "
      "$Modm, V, togglegroup,"

      # Zoom
      "$Modm, M, exec, pypr zoom ++0.8"
      "$Modm, B, exec, pypr zoom --0.8"

      # Move Windows of Group
      "$ModS, R, movewindoworgroup, l"
      "$ModS, N, movewindoworgroup, r"
      "$ModS, C, movewindoworgroup, u"
      "$ModS, T, movewindoworgroup, d"
    ];

    bindm = [
      "$Modm, mouse:272, movewindow"
      "$Modm, mouse:273, resizewindow"
    ];
  };
}
