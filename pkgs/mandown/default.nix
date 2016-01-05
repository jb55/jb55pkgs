{ stdenv
, makeWrapper
, pandoc
, fetchFromGitHub
, man
}:
stdenv.mkDerivation rec {
  name = "mandown-${version}";
  version = "0.8.1";

  src = fetchFromGitHub {
    rev = "d69c1c64ad3376eeaeab40b6810a2c1e16881566";
    owner = "jb55";
    repo = "mandown";
    sha256 = "09jk9qqpgkxpv45a7chjavdr7m4l1l27y4xs3flhfgjwcimxmh3p";
  };

  makeFlags = "PREFIX=$(out)";

  buildInputs = [ pandoc man makeWrapper ];

  meta = with stdenv.lib; {
    description = "Render markdown as a manpage";
    homepage = "https://github.com/jb55/mandown";
    maintainers = with maintainers; [ jb55 ];
    license = licenses.gpl2;
  };

  installPhase = ''
    wrapProgram "$out/bin/mandown" \
      --prefix PATH : "${man}/bin:${pandoc}/bin"
  '';
}
