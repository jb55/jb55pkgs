{ stdenv
, fetchFromGitHub
, csv-delim
}:
stdenv.mkDerivation rec {
  name = "csv-scripts-${version}";
  version = "0.2.2";

  buildInputs = [ csv-delim ];

  src = fetchFromGitHub {
    owner = "jb55";
    repo = "csv-scripts";
    rev = version;
    sha256 = "08z1h2rx21pf5a5bz1kzd8cfpyyw3a3byl9239mrwgqy0dwgjccy";
  };

  patchPhase = ''
    for file in "bin/"*; do
      sed -i 's,csv-delim,${csv-delim}/bin/csv-delim,g' "$file"
    done;
  '';

  makeFlags = "PREFIX=$(out)";
}
