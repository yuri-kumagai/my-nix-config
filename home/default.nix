{ config, pkgs, ... }:

{
  imports = [
    ./home.nix
    ./programs.nix
    ./packages.nix
    ./git.nix
    ./environment.nix
    ./neovim.nix
  ];
}
