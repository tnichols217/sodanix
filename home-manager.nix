{ config, pkgs, stablepkgs, ... }:

{
  home-manager.users."soda" = {
    home = {
      stateVersion = "24.05";
    };
    programs = {
      git = {
        enable = true;
        userName = "meirisoda";
        userEmail = "appleblossom2001@gmail.com";
        lfs = {
          enable = true;
        };
      };
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        syntaxHighlighting.enable = true;
        autocd = true;
        oh-my-zsh = {
          enable = true;
        };
        plugins = [
          {
            file = "powerlevel10k.zsh-theme";
            name = "powerlevel10k";
            src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
          }
          {
            name = "powerlevel10k-config";
            file = "p10k.zsh";
            src = ./p10k;
          }
        ];
        shellAliases = {
          ga = "git add *";
          gac = "git commit -am";
          gacp = "git add -A && git commit -am $argv; git push";
          gp = "git push";
          gpl = "git pull";
          nvo = "nvidia-offload";
          rssound = "systemctl --user restart pipewire";
          flakeupg = "nix flake upgrade";
        };
      };
      kitty = {
        enable = true;
        settings = {
          background_opacity = "0.5";
          background_blur = 5;
        };
      };
      fzf = {
        enable = true;
        enableBashIntegration = true;
      };
    };
  };
}