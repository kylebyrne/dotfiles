{ config, lib, pkgs, ... }:

{

  nixpkgs.config = {
    allowUnfree = true;
  };
  nixpkgs.overlays =
      let path = ./overlays; in with builtins;
      map (n: import (path + ("/" + n)))
          (filter (n: match ".*\\.nix" n != null ||
                      pathExists (path + ("/" + n + "/default.nix")))
                  (attrNames (readDir path)));

  home.packages = with pkgs; [
    exa
    bat
    ripgrep
    autojump

    # Development
    neovim
    direnv

    # Currently tmux in nix isn't supporting the popup window from fzf-tmux
    # tmux
    Firefox
    Hammerspoon
    starship
  ];

  # services.lorri.enable = true;
  programs.fzf = {
    enable = true;
  };

  home.file.".hammerspoon".source = /dots/config/hammerspoon;

  programs.alacritty = {
    enable = true;
    settings = lib.attrsets.recursiveUpdate (import ./alacritty.nix) {
      shell.program = "/bin/zsh";
    };
  };

  # programs.git = {
  #   enable = true;
  #   userName = "Kyle Byrne";
  #   userEmail = "kyletbyrne96@gmail.com";
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "19.09";
}
