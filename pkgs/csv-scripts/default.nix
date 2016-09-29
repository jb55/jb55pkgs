{ stdenv
, fetchFromGitHub
, csv-delim
}:
stdenv.mkDerivation rec {
  name = "csv-scripts-${version}";
  version = "0.2.1";

  buildInputs = [ csv-delim ];

  src = fetchFromGitHub {
    owner = "jb55";
    repo = "csv-scripts";
    rev = version;
    sha256 = "1vwr23ik01pp3zndyk19ssnl0aac5qcisff0linkpxkx4r436q92";
  };

  patchPhase = ''
    for file in "bin/"*; do
      sed -i 's,csv-delim,${csv-delim}/bin/csv-delim,g' "$file"
    done;
  '';

  makeFlags = "PREFIX=$(out)";
}
