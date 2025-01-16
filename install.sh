# nixのインストール
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# home-managerによる設定反映
nix run home-manager/master -- switch --flake .#y_kumagai
