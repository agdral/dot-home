{
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    name = "oreo_spark_blue_cursors";
    size = 24;
    package = pkgs.oreo-cursors-plus;
    hyprcursor.enable = true;
    gtk.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    dirDotfiles = "${config.home.homeDirectory}/.config/home-manager/Home-Default/dotfiles";
    dirScripts =  "${config.home.homeDirectory}/.config/home-manager/Home-Default/scripts";
    dirSheets = "/hdd/kael/Documentos/Sheets";
    dirDocs = "/hdd/kael/Documentos/Docs";
    dirSlides = "/hdd/kael/Documentos/Slides";
    dirDatasets = "/hdd/kael/Documentos/Datasets";
    dirBooks = "/hdd/kael/Documentos/Books";
    dirImages = "/hdd/kael/Graficos/Images";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita";
      icon-theme = "Papirus-Dark";
      document-font-name = "Noto Sans 10";
      font-name = "Noto Sans 10";
      monospace-font-name = "Noto Sans Mono 10";
      cursor-theme = "oreo_spark_blue_cursors";
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme.name = "Adwaita";
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfreePredicate = _: true;
  };
}
