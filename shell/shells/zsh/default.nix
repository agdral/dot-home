{...}: {
  programs.zsh = {
    enable = true;
    initContent = ''
      eval "$(starship init zsh)"
      eval "$(atuin init zsh)"
      eval "$(zoxide init zsh)"
    '';
  };
}
