{ pkgs ? import (fetchTarball https://nixos.org/channels/nixos-18.09/nixexprs.tar.xz) {}
, yarn2nix ? import (fetchTarball https://github.com/moretea/yarn2nix/archive/780e33a07fd821e09ab5b05223ddb4ca15ac663f.tar.gz) { inherit pkgs; }
}: rec {
  sethret = yarn2nix.mkYarnPackage {
    name = "sethret";
    src = pkgs.lib.sourceByRegex ./. [ "index.js" "package.json" ];
    packageJson = ./package.json;
    yarnLock = ./yarn.lock;
  };
}
