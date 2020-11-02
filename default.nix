{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs {}
}:

pkgs.yarn2nix-moretea.mkYarnPackage {
  name = "sethret";
  src = pkgs.lib.sourceByRegex ./. [ "index.js" "package.json" ];
  packageJson = ./package.json;
  yarnLock = ./yarn.lock;
}
