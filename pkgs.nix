rec {
  nixpkgs = fetchGit {
    name = "nixos-unstable-2019-10-23";
    url = "https://github.com/NixOS/nixpkgs-channels";
    rev = "4cd2cb43fb3a87f48c1e10bb65aee99d8f24cb9d";
  };
  pkgs = import nixpkgs {};

  yarn2nix = import (fetchGit {
    url = "https://github.com/moretea/yarn2nix";
    rev = "780e33a07fd821e09ab5b05223ddb4ca15ac663f";
  }) { inherit pkgs; };
}
