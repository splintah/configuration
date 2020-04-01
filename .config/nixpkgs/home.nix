{ pkgs, config, lib, ... }:
let prelude = import ./prelude.nix; in
{
  imports = [
    ./modules
  ];

  nixpkgs.config.packageOverrides = pkgs:
    (import ./pkgs { inherit pkgs; }) //
    {
      unstable = import <nixos-unstable> {
        config = config.nixpkgs.config;
      };
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
      clang = pkgs.clang.overrideAttrs (attrs: {
        meta.priority = pkgs.gcc.meta.priority + 1; # lower priority than gcc
      });
    };

  nixpkgs.config.allowUnfree = true;

  home.packages =
    with builtins; with prelude; with pkgs;
      flattenAttrs
        {
          application = [
            libreoffice
            anki
            wineFull
            dmenu
            musescore
            signal-desktop
          ];

          audio = [
            flac
            cdparanoia
            id3

            mpc_cli
            mpdscribble

            unstable.spotify-tui
          ];

          browser = [
            torbrowser
            qutebrowser
          ];

          documentation = [
            zeal
            manpages
            stdmanpages
          ];

          editor = [
            vim
            ed
            irony-server
          ];

          files = [
            ## File managers
            ranger
            nnn
            ## Downloading/uploading
            transmission-gtk
            wget
            curl
            onedrive
          ];

          fonts = [
            fantasque-sans-mono
            fira
            fira-code
            fira-mono
            font-awesome-ttf
            inconsolata
            libertine
            symbola
	          dejavu_fonts
	          siji
	          unifont
            crimson
            ibm-plex
            mononoki
            unstable.jetbrains-mono
            unstable.cascadia-code
          ];

          games = [
            desmume
            (freeciv.override {
              gtkClient = true;
              sdlClient = false;
            })
            openttd
            scid-vs-pc
          ];

          graphics = [
            ## Viewers
            sxiv
            ## Screenshots
            scrot
            ## Editors
            gimp
            inkscape
            ## Fonts
            fontforge-gtk
          ];

          mail = [
            thunderbird
            neomutt
            mailutils
            mu
          ];

          media = [
            rtv
            termtekst
          ];

          programming = {
            buildSystems = [ gnumake ];
            ides = [ arduino ];
            misc = [ radare2 radare2-cutter nix-prefetch-git ];

            agda = [ haskellPackages.Agda AgdaStdlib ];
            c = [
              gcc
              clang
              tinycc
              binutils
              indent
            ];
            coq = [ coq ];
            haskell = [
              ghc
              cabal-install
              stack
              haskellPackages.hindent
              haskellPackages.pointfree
              haskellPackages.hoogle
              haskellPackages.hlint
              haskellPackages.ghcid
              haskellPackages.stylish-haskell
              haskellPackages.hasktags
              cabal2nix
              # (let all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {}; in
              #   all-hies.selection { selector = p: { inherit (p) ghc865 ghc864; }; }
              # )
            ];
            idris = [ idris ];
            lisp = [ sbcl ];
            nix = [ haskellPackages.nixfmt ];
            ocaml = [
              ocaml
              opam
              ocamlPackages.utop
              ocamlweb
              gnum4
            ];
            octave = [ octaveFull ];
            pascal = [ fpc ];
            python = [
              python2
              python3
              python37Packages.pip
            ];
            racket = [ racket ];
            rust = [
              rustup
              # wasm-pack
              rustracer
            ];
            scheme = [ guile ];
            standardML = [ smlnj ];
          };

          system = [
            aspell aspellDicts.en aspellDicts.nl
            calc
            cmatrix
            coreutils
            entr
            fd
            file
            gnupg
            gnutar
            gtypist
            hplip
            intel-gpu-tools
            libGL
            libnotify
            lshw
            neofetch
            openssh
            openssl
            patchelf
            pkg-config
            qrencode
            ripgrep
            tokei
            tree
            xcape
            xclip
            xdo
            xdotool
            xfontsel
            xorg.xev
            xz
            zip unzip
          ];

          typesetting = [
            pandoc
            groff
          ];

          video = [
            ## Viewing
            vlc
            ## Downloading
            youtubeDL
            ## Editing
            ffmpeg
          ];
        };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  programs.feh.enable = true;
  programs.mpv.enable = true;
  programs.htop.enable = true;

  programs.opam = {
    enable = true;
    enableBashIntegration = true;
  };

  home.sessionVariables = rec {
    EDITOR = "emacsclient -c";
    VISUAL = EDITOR;
  };
}
