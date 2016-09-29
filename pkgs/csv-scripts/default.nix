{ stdenv
, fetchFromGitHub
, csv-delim
}:
stdenv.mkDerivation rec {
  name = "csv-scripts-${version}";
  version = "0.1";

  buildInputs = [ csv-delim ];

  src = fetchFromGitHub {
    owner = "jb55";
    repo = "csv-scripts";
    rev = version;
    sha256 = "19fx38wbrp8h7ip5yw6kx20cqny1wik37ra6dxam3qyp46xsb1j9";
  };

  fixupPhase = ''
    for file in "$out/bin/"*; do
      sed -i 's,csv-delim,${csv-delim}/bin/csv-delim,g' "$file"
    done;
  '';

  makeFlags = "PREFIX=$(out)";
}
