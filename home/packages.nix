{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    lazygit
    bat
    fzf
    broot
    ripgrep
    helix
    gh
  ];
}
