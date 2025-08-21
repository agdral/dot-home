{pkgs, ...}: {
  home.packages = with pkgs; [
    claude-code
  ];
  programs.fish = {
    interactiveShellInit = ''
      set -Ux ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
      set -Ux ANTHROPIC_MODEL deepseek-chat
      set -Ux ANTHROPIC_SMALL_FAST_MODEL deepseek-chat
    '';
  };
}
