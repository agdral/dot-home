{pkgs, ...}: {
  programs = {
    pay-respects = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
