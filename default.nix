{ nixpkgs ? import <nixpkgs> {} }:
let callPackage = nixpkgs.pkgs.callPackage;
in rec {
  dbopen = callPackage ./pkgs/dbopen { };
  # curlc = callPackage ./pkgs/curlc { };
  sharefile = callPackage ./pkgs/sharefile { };
  mandown = callPackage ./pkgs/mandown { };
  extname = callPackage ./pkgs/extname { };
  csv-delim = callPackage ./pkgs/csv-delim { };
  snap = callPackage ./pkgs/snap { inherit sharefile; };
}
