{ config, pkgs, ... }:

{
  home.username = "nothing";
  home.homeDirectory = "/home/nothing";
  home.stateVersion = "25.11";

  # User Level Packages
  home.packages = with pkgs; [
    ripgrep
    typescript-language-server
    pyright
    clang-tools
    lua-language-server
    vscode-langservers-extracted
    nil
    nixpkgs-fmt
    nixfmt
    black
    prettier
    stylua
    lua
    nodejs
    python3
    typescript
    gcc
    libgcc
    gdb
    gimp
    obsidian
    fastfetch
    alacritty
    picom
    flameshot
    feh
    neovim
    fzf
    bat
    btop
    pywal16
    imagemagick
    lxappearance
    i3status
    dmenu
    pywalfox-native
  ];

  # Vesktop
  programs.vesktop.enable = true;

  # Firefox
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [ pkgs.pywalfox-native ];
  };

  # Bash
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/NixOS/non-os#null-pc";
      nfu = "nix flake update";
      vcx = "vim ~/NixOS/non-os/configuration.nix";
      vhx = "vim ~/NixOS/non-os/home.nix";
      vfx = "vim ~/NixOS/non-os/flake.nix";
      install = "nix-shell -p";
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      ff = "fastfetch";
      vim = "nvim";
    };
    initExtra = ''
      export PS1='\[\e[38;5;82m\]\u\[\e[0m\] in \[\e[38;5;81m\]\w\[\e[0m\] \\$ '
    '';
  };

  # Fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    functions = {
      fish_prompt = {
        body = ''
          set_color green
          printf "%s" (whoami)

          set_color normal
          printf " in "

          set_color blue
          printf "%s" (prompt_pwd)

          set_color normal
          printf "%s \$ "
        '';
      };
    };
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/NixOS/non-os#null-pc";
      nfu = "nix flake update";
      vcx = "vim ~/NixOS/non-os/configuration.nix";
      vhx = "vim ~/NixOS/non-os/home.nix";
      vfx = "vim ~/NixOS/non-os/flake.nix";
      install = "nix-shell -p";
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      ff = "fastfetch";
      vim = "nvim";
    };
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

  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          y = 10;
          x = 10;
        };
      };
      font = {
        size = 10;
        normal.family = "JetBrainsMono NF";
        bold.family = "JetBrainsMono NF";
        italic.family = "JetBrainsMono NF";
      };
      # general.import = [ "~/.cache/wal/colors-alacritty.toml" ]; # Uncomment this if you want to use pywal colors
      colors = {
        bright = {
          black = "#444b6a";
          blue = "#7da6ff";
          cyan = "#0db9d7";
          green = "#b9f27c";
          magenta = "#bb9af7";
          red = "#ff7a93";
          white = "#acb0d0";
          yellow = "#ff9e64";
        };
        normal = {
          black = "#32344a";
          blue = "#7aa2f7";
          cyan = "#449dab";
          green = "#9ece6a";
          magenta = "#ad8ee6";
          red = "#f7768e";
          white = "#787c99";
          yellow = "#e0af68";
        };
        primary = {
          background = "#1a1b26";
          foreground = "#a9b1d6";
        };
      };
    };
  };

  # i3status
  programs.i3status = {
    enable = true;
    enableDefault = false;
    general = {
      interval = 1;
      colors = true;
    };
    modules = {
      "tztime local" = {
        position = 10;
        settings = {
          format = "%I:%M %p |  %A,  %d %B %Y ";
        };
      };
    };
  };

  # Bat
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin Mocha";
    };
  };
}
