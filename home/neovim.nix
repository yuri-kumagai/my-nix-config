{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.file = {
    ".config/nvim/init.lua".source = ./neovim/init.lua;
  };
}
