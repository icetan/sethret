let
  pkgs' = import ./pkgs.nix;
in
{ pkgs ? pkgs'.pkgs
, yarn2nix ? pkgs'.yarn2nix
}: rec {
  sethret = yarn2nix.mkYarnPackage {
    name = "sethret";
    src = pkgs.lib.sourceByRegex ./. [ "index.js" "package.json" ];
    packageJson = ./package.json;
    yarnLock = ./yarn.lock;
  };
}
