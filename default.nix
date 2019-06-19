{ pkgs }:
let callPackage = pkgs.callPackage;
    callHsPackage = pkgs.haskellPackages.callPackage;
    fetchGitHub = rest: args: callPackage (pkgs.fetchFromGitHub ({
      owner = "jb55";
    } // rest)) args;
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
                  rev    = "5a51083ec33883d3fec3c74cb0891b317f4d1f35";
                  sha256 = "1mdkpd8rc5y4a4j0mwv7mkfd58a43mpxkxhrjlkkmcf2nngvqi0j";
                } {};

  hearpress   = callHsPackage ./pkgs/hearpress { };
}
