with rec {
  pkgs = nixos-stable // {
    all      = all;
    stable   = stable;
    unstable = unstable;
  };

  home = builtins.getEnv "HOME";

  channelPath = name: file:
    "${home}/.nix-defexpr/channels/${name}/pkgs/top-level/${file}";

  channel = name: file: import (channelPath name file) { config = config; };

  nixos-stable   = channel "nixos-16.03" "all-packages.nix";
  nixos-unstable = channel "nixos-unstable" "default.nix";

  config.allowUnfree = true;

  config.chromium = {
    enablePepperFlash = true;
    enablePepperPDF   = true;
    enableWideVine    = true;
  };

  all = with nixos-stable; buildEnv {
    name = "all";
    paths = [ stable unstable ];
  };

  stable = let pkgs = nixos-stable; in with pkgs; buildEnv {
    name = "stable";
    paths = [

      ack

      jmtpfs                             # Android

      zip unzip gnome3.file-roller       # Archives

      chromium                           # Chromium

      keepassx2 truecrypt                # Crypto

      sassc                              # CSS

      meld                               # Diff tools

      evince gnome3.eog                  # Doc/image viewers

      bridge-utils                       # Docker
      pythonPackages.docker_compose

      vim idea.idea15-ultimate           # Editors

      elixir rebar                       # Elixir

      ((import "${home}/emacs/emacs.nix") pkgs) # Emacs

      steam minecraft                    # Gaming

      gitAndTools.gitFull                # Git
      gitAndTools.hub

      haskellPackages.cabal-install      # Haskell
      haskellPackages.stack
      haskellPackages.stylish-haskell
      haskellPackages.cabal2nix

      curl wget                          # HTTP

      gimp imagemagick inkscape          # Image editing
      kde4.kcolorchooser

      gnome3.polari                      # IRC
      kde4.konversation

      openjdk8                           # JVM

      jq                                 # JSON

      moc pithos                         # Music

      nmap                               # Networking
      nix-repl nix-prefetch-scripts      # Nix

      tesseract                          # OCR

      gparted gptfdisk                   # Partitioning

      scrot gnome3.gnome-screenshot      # Screenshots

      fish tmux man tree which           # Shell

      sshfsFuse                          # SSH mount

      htop lsof psmisc pciutils          # System inspection
      baobab ncdu

      skype                              # Telephony

      transmission_gtk                   # Torrent

      usbutils

      alsamixer ffmpeg mpv vlc           # Video/audio
      gnome3.totem gstreamer

      xclip xorg.xkill                   # X utils
    ];
  };

  unstable = let pkgs = nixos-unstable; in with pkgs; buildEnv {
    name = "unstable";
    paths = [





      #((callPackage ./idea/default.nix { }).idea15-ultimate)
    ];
  };

}; pkgs
