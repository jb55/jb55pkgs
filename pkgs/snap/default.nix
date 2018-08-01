{ stdenv, sharefile, maim, libnotify, xclip, makeWrapper, fetchFromGitHub }:

let inputs = [ sharefile maim libnotify xclip ];
    buildPaths = sep: fmt:
      "${stdenv.lib.concatStringsSep sep (map fmt inputs)}";
in stdenv.mkDerivation rec {
  name = "snap-${version}";
  version = "1.1";

  src = fetchFromGitHub {
    rev = version;
    owner = "jb55";
    repo = "sharefile-snap";
    sha256 = "03kw2yrmy9hh86rz60mhmrz0xz4gwhbmmpq5fwa5bf3awpp733ad";
  };

  buildInputs = [ makeWrapper ] ++ inputs;

  installPhase = ''
    mkdir -p $out/bin
    cp snap $out/bin

    wrapProgram "$out/bin/snap" \
      --prefix PATH : "${buildPaths ":" (f: "${f}/bin")}"
  '';

  meta = with stdenv.lib; {
    description = "quick screenshot upload via scrot and sharefile";
    homepage = "https://github.com/jb55/sharefile-snap";
    maintainers = with maintainers; [ jb55 ];
    license = licenses.mit;
  };
}
