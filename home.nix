{ config, pkgs, ... }:

{
  home.username = "nothing";
  home.homeDirectory = "/home/nothing";
  home.stateVersion = "25.11";
  
  # Bash
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#null-pc";
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
}
