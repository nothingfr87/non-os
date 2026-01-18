{ config, pkgs, ... }:

{
  home.username = "nothing";
  home.homeDirectory = "/home/nothing";
  home.stateVersion = "25.11";

  # User Packages
  home.packages = with pkgs; [
    ripgrep
    # Language Servers
    typescript-language-server
    pyright
    clang-tools
    lua-language-server
    vscode-langservers-extracted
    nixd
    nixpkgs-fmt
    # Languages Compilers & Interpreters
    lua
    luajit
    nodejs
    typescript
    gcc
    libgcc
    gdb
  ];

  # Bash
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      nrs = "sudo nixos-rebuild switch --flake .#null-pc";
    };
    initExtra = ''
      export PS1='\[\e[38;5;82m\]\u\[\e[0m\] in \[\e[38;5;81m\]\w\[\e[0m\] \\$ '
    '';
  };

  # Git
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Nothing";
	      email = "173809041+nothingfr87@users.noreply.github.com";
      };
    };
  };
 
  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/i3".source = ./config/i3;
  home.file.".config/i3status".source = ./config/i3status;
  home.file.".config/alacritty".source = ./config/alacritty;
}
