{ stdenv
, fetchFromGitHub
, csv-delim
}:
stdenv.mkDerivation rec {
  name = "csv-scripts-${version}";
  version = "0.2.3";

  buildInputs = [ csv-delim ];

  src = fetchFromGitHub {
    owner = "jb55";
    repo = "csv-scripts";
    rev = version;
    sha256 = "0lw1x2cajam38d49p5cm8l35jqkhz034zimbh1wycly434cr16yg";
  };

  patchPhase = ''
    for file in "bin/"*; do
      sed -i 's,csv-delim,${csv-delim}/bin/csv-delim,g' "$file"
    done;
  '';

  makeFlags = "PREFIX=$(out)";
}
