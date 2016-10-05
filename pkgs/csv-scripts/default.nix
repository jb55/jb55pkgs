{ stdenv
, fetchFromGitHub
, csv-delim
, bc
}:
stdenv.mkDerivation rec {
  name = "csv-scripts-${version}";
  version = "0.2.5";

  buildInputs = [ csv-delim bc ];

  src = fetchFromGitHub {
    owner = "jb55";
    repo = "csv-scripts";
    rev = version;
    sha256 = "0w4sldalnfxyrkfqsr6spp7s3fqrjlxjxbq7lzpqb0iqacsw3ali";
  };

  patchPhase = ''
    for file in "bin/"*; do
      sed -i 's,csv-delim,${csv-delim}/bin/csv-delim,g' "$file"
    done;
    sed -i 's,bc,${bc}/bin/bc,' bin/csv-sum
  '';

  makeFlags = "PREFIX=$(out)";
}
