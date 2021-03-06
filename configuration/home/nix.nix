{ pkgs, config, ... }:
let
  sources = import ../../nix/sources.nix;
  rnix-lsp = "${pkgs.rnix-lsp}/bin/rnix-lsp";
  eglotEnable = config.programs.emacs.init.usePackage.eglot.enable;
in {
  home.packages = [
    pkgs.nix-prefetch-git
    pkgs.cachix
    pkgs.haskellPackages.nixfmt
    pkgs.niv
    # pkgs.nix-doc
  ];

  # xdg.configFile."nix/nix.conf".text = ''
  #   plugin-files = ${pkgs.nix-doc}/lib/libnix_doc_plugin.so
  # '';

  programs.emacs.init.usePackage = {
    nix-mode = {
      enable = true;
      after = [ "general" ] ++ (if eglotEnable then [ "eglot" ] else [ ]);
      init = if eglotEnable then ''
        (add-to-list 'eglot-server-programs '(nix-mode . ("${rnix-lsp}")))
      '' else
        "";
      config = ''
        (general-define-key
          :prefix my-local-leader
          :states '(normal visual motion)
          :keymaps 'nix-mode-map
          "c" '(nix-build :which-key "Build")
          "f" '(nix-format-buffer :which-key "Format buffer")
          "r" '(nix-repl :which-key "REPL"))
      '';
    };
  };
}
