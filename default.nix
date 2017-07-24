{ nixpkgs ? import <nixpkgs> {} }:
let callPackage = nixpkgs.pkgs.callPackage;
    callHsPackage = nixpkgs.pkgs.haskellPackages.callPackage;
    callRemote = r: d: callPackage (callPackage r {}) d;
in rec {
  curlc       = callRemote  ./pkgs/curlc {};
  csv-delim   = callPackage ./pkgs/csv-delim { };
  csv-scripts = callPackage ./pkgs/csv-scripts { inherit csv-delim; };
  dbopen      = callPackage ./pkgs/dbopen { };
  extname     = callPackage ./pkgs/extname { };
  mandown     = callPackage ./pkgs/mandown { };
  snap        = callPackage ./pkgs/snap { inherit sharefile; };
  sharefile   = callPackage ./pkgs/sharefile { };
  samp        = callPackage ./pkgs/samp { };
  hearpress   = callHsPackage ./pkgs/hearpress { };
}
