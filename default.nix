{ nixpkgs ? import <nixpkgs> {} }:
let callPackage = nixpkgs.pkgs.callPackage;
in {
  dbopen = callPackage ./pkgs/dbopen { };
  # curlc = callPackage ./pkgs/curlc { };
  sharefile = callPackage ./pkgs/sharefile { };
  mandown = callPackage ./pkgs/mandown { };
}
