{ stdenv
, python
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  name = "dbopen-${version}";
  version = "1.1";
  buildInputs = [ python ];

  src = fetchFromGitHub {
    rev = "a2ccc78a54ad6a62677d01175ad0c94aea424664";
    owner = "jb55";
    repo = "dbopen";
    sha256 = "1nh5xajfr0nix4mv7qpn8qrs2bs33h9i43yyh548dgbvmlcprch2";
  };

  configurePhase = "mkdir -p $out/bin";
  makeFlags = "PREFIX=$(out)";
}
