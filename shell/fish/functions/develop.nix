{
  nix-template = ''
    nix flake init --template "$argv[1]"
    direnv allow
  '';
  np-cpp = "nix-template 'https://flakehub.com/f/the-nix-way/dev-templates/*#c-cpp'";
  np-go = "nix-template 'https://flakehub.com/f/the-nix-way/dev-templates/*#go'";
  np-kotlin = "nix-template 'https://flakehub.com/f/the-nix-way/dev-templates/*#kotlin'";
  np-csharp = "nix-template 'https://flakehub.com/f/the-nix-way/dev-templates/*#csharp'";
  np-rust = "nix-template 'https://flakehub.com/f/the-nix-way/dev-templates/*#rust'";
  np-java = "nix-template 'https://flakehub.com/f/the-nix-way/dev-templates/*#java'";
  np-bun = "nix-template 'https://flakehub.com/f/the-nix-way/dev-templates/*#bun'";
  np-python = "nix-template 'https://flakehub.com/f/the-nix-way/dev-templates/*#python'";
}
