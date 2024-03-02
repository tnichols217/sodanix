{ config, lib, hostname, pkgs, stablepkgs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [
    # system

    # development
    cudatoolkit
    
    # utilities
    android-tools
    nvtop
    # "${watershot}"

    # virtualisation
    qemu
    virt-manager
    wineWowPackages.stable

    # programs
    ani-cli
    audacity
    blender
    gimp
    inkscape
    jellycli
    jellyfin-media-player
    krita
    libreoffice
    obs-studio
    pdfsam-basic
    puredata
    sonic-pi
    (pkgs.callPackage ./soda/packages/programs/sunvox.nix {})
    zoom-us

    # games
    lutris
    prismlauncher
    steam
    
  ] else [
    
  ]) ++ [ # TODO both systems
    # system
    comma
    curl
    openssh
    pciutils
    wget
    xorg.xrandr
    yubico-pam

    # development
    cmake
    docker
    zsh
    zsh-powerlevel10k
    
    # utilities
    barrier
    bat 
    btop
    gparted
    fd
    ffmpeg
    freefilesync
    graphviz
    kime
    lsd
    lshw
    man-pages
    mpv
    mullvad
    mullvad-vpn
    neofetch
    noisetorch
    piper
    rofi
    syncthing
    qbittorrent
    qpwgraph

    # programs
    bitwarden
    calibre
    discord
    element-desktop
    kitty
    localsend
    obsidian
    spotify
    tidal-hifi
    vscodium
  ];

  programs = {
    zsh.enable = true;
    noisetorch.enable = true; 
    virt-manager.enable = true;
    kdeconnect = {
      enable = true;
    };
    adb = {
      enable = true; 
    };
  };
}