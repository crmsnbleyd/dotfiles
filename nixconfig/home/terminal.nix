{ pkgs, ... }:

# Platform-independent terminal setup
{
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    # Unix tools
    ripgrep # Better `grep`
    fd
    sd
    tree
    neofetch
    aspell
    aspellDicts.en
    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt
    nixci

    # Dev
    cmake
    helix
    imagemagick
    jq
    just
    pandoc
    rlwrap
    tmate
    typst
    wget
    python3Packages.django

    # Languages
    black
    go
    gopls
    pyright
    rustup
    sbcl

    nix-health
  ];

  home.shellAliases = {
    g = "git";
  };

  xdg.configFile."fish/themes/Catppuccin Latte.theme".source = let
    catppuccin-fish = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "fish";
      rev = "0ce27b518e8ead555dec34dd8be3df5bd75cff8e";
      hash = "sha256-Dc/zdxfzAUM5NX8PxzfljRbYvO9f9syuLO8yBr+R3qg=";
    };
  in
    "${catppuccin-fish}/themes/Catppuccin Latte.theme";

  # Programs natively supported by home-manager.
  programs = {
    bat.enable = true;
    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    htop.enable = true;

    # command-not-found handler to suggest nix way of installing stuff.
    # FIXME: This ought to show new nix cli commands though:
    # https://github.com/nix-community/nix-index/issues/191
    # nix-index = {
    #   enable = true;
    #   enableZshIntegration = true;
    # };

    # on macOS, you probably don't need this
    bash = {
      enable = true;
      initExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
      '';
    };

    fish = {
      enable = true;
    };

    # https://zero-to-flakes.com/direnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    # https://nixos.asia/en/git
    git = {
      enable = true;
      userName = "Drew";
      userEmail = "arnav.jose@infoworks.io";
      extraConfig = {
        init.defaultBranch = "trunk";
      };
    };
  };
}
