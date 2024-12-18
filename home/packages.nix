{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
    bat
    fzf
    broot
    ripgrep
    helix
    gh
  ];
}
