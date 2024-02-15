{ config, pkgs, username, stablepkgs, ...}:

{
  imports =
    [ 
      (pkgs.callPackage ./packages/comma.nix {inherit username;})
      # ./packages/hyprland.nix
      # ./packages/plasma.nix
      (pkgs.callPackage ./packages/rofi.nix {inherit username;})
      ./packages/vscode.nix
    ];
}