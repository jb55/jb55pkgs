{ stdenv, sharefile, scrot, libnotify, xclip, makeWrapper, fetchFromGitHub }:

let inputs = [ sharefile scrot libnotify xclip ];
    buildPaths = sep: fmt:
      "${stdenv.lib.concatStringsSep sep (map fmt inputs)}";
in stdenv.mkDerivation rec {
  name = "snap-${version}";
  version = "0.3";

  src = fetchFromGitHub {
    rev = version;
    owner = "jb55";
    repo = "sharefile-snap";
    sha256 = "1clckdgcl4lmb1nnmpmlwnx6s2w4xfrnda30v6w8i5lg8dp9slxv";
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
