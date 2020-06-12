{ config, pkgs, lib, ... }:

let 
  hammerspoon = pkgs.callPackage /users/kylebyrne/.config/nixpkgs/darwin/hammerspoon.nix { };
in {
  imports = [ ./lorri.nix ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages =
  #   [ pkgs.vim
  #   ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix = {
    # Auto upgrade nix package
    package = pkgs.nix;
    nixPath = lib.mkDefault (lib.mkBefore [ "nixpkgs=/nix/var/nix/profiles/per-user/kylebyrne/channels/nixpkgs" ]);
  };
  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  environment.systemPackages = with pkgs; [
    home-manager
    git
    hammerspoon
    zsh
    # _1password
  ];
  environment.shells = [ pkgs.zsh ];

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.bash.enable = false;
  programs.zsh.enable = true;
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 4;
  nix.buildCores = 1;

  services.nix-daemon.enable = true;
}
