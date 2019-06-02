{ nixpkgs ? import <nixpkgs> {} }:
let callPackage = nixpkgs.pkgs.callPackage;
    callHsPackage = nixpkgs.pkgs.haskellPackages.callPackage;
    fetchGitHub = rest: callPackage (nixpkgs.pkgs.fetchFromGitHub ({
      owner = "jb55";
    } // rest)) {};
in rec {
  curlc       = callPackage ./pkgs/curlc {};
  csv-delim   = callPackage ./pkgs/csv-delim { };
  csv-scripts = callPackage ./pkgs/csv-scripts { inherit csv-delim; };
  dbopen      = callPackage ./pkgs/dbopen { };
  extname     = callPackage ./pkgs/extname { };
  mandown     = callPackage ./pkgs/mandown { };
  snap        = callPackage ./pkgs/snap { inherit sharefile; };
  sharefile   = callPackage ./pkgs/sharefile { };
  samp        = callPackage ./pkgs/samp { };
  ratio       = callPackage ./pkgs/ratio { };

  bcalc       = fetchGitHub {
                  repo   = "bcalc";
                  rev    = "d4cc28f367ff6e43d51afc8b4be018aa7385cf86";
                  sha256 = "02ns6kfnp5g10m2ivhkspp1iws511bcxzw2455ny38hq14f8q1am";
                };

  hearpress   = callHsPackage ./pkgs/hearpress { };
}
