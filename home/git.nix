{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "omutucat";
    userEmail = "y.kuma1102@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
