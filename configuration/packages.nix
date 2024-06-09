{ config, lib, hostname, pkgs, stablepkgs, attrs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [
    # system
    asusctl
    tlp

    # development
    
    # utilities
    android-tools
    gallery-dl
    nvtopPackages.full
    powertop

    # virtualisation
    wineWowPackages.stable

    # programs
    ani-cli
    ardour
    audacity
    # blender
    gimp
    inkscape
    krita
    libreoffice
    obs-studio
    pdfsam-basic
    puredata
    scrcpy
    sunvox
    # (pkgs.callPackage ./soda/config/programs/sunvox.nix {})
    ungoogled-chromium
    zoom-us

    # games
    lutris
    prismlauncher
    steam
    
  ] else [
    
  ]) ++ [ # TODO both systems
    # system
    comma
    openssh
    pciutils
    wget
    xorg.xrandr
    yubico-pam

    # hyprland
    blueman
    brightnessctl
    kdePackages.dolphin
    dunst
    grimblast
    hypridle
    hyprlock
    hyprpaper
    jq
    kdePackages.konsole
    gnome.nautilus
    networkmanagerapplet
    pavucontrol
    rofi
    xfce.thunar
    tofi
    waybar
    wireplumber
    wl-clipboard
    xplr

    # development
    zsh
    zsh-powerlevel10k
    
    # utilities
    bat 
    btop
    gparted
    fd
    file
    ffmpeg
    graphviz
    jellyfin-media-player
    kime #korean keyboard
    lsd
    lshw
    man-pages
    mpv
    mullvad
    mullvad-vpn
    neofetch
    noisetorch
    piper
    syncthing
    tailscale
    qbittorrent
    qpwgraph
    yt-dlp

    # programs
    bitwarden
    calibre
    discord
    element-desktop
    kitty
    localsend
    obsidian
    signal-desktop
    spotify
    tidal-hifi
    trilium-desktop
    vscodium
  ];

  programs = {
    adb.enable = true;
    kdeconnect = {
      enable = true;
    };
    noisetorch.enable = true; 
    virt-manager.enable = true;
    zsh.enable = true;
  };

  services.tailscale.enable = true;
}