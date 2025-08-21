{...}: {
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fish = {
      interactiveShellInit = ''
        direnv hook fish | source
      '';
    };
  };
}
