{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Y-Kumagai";
    userEmail = "y_kumagai@ims-net.org";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
