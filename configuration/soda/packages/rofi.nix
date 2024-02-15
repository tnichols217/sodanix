{ config, pkgs, stablepkgs, username, ... }:

{
  home-manager.users.${username} = {
    let
      inherit (config.lib.formats.rasi) mkLiteral;
      rofi-theme = {
        "*" = {
          background-color = mkLiteral "#ebebeb";
        };
      };
    in {
      programs.rofi = {
        enable = true;
        theme = rofi-theme;
      };
    }
  };
}
