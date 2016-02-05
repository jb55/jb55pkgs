{ stdenv, sharefile, scrot, libnotify, xclip, makeWrapper, fetchFromGitHub }:

let inputs = [ sharefile scrot libnotify xclip ];
    buildPaths = sep: fmt:
      "${stdenv.lib.concatStringsSep sep (map fmt inputs)}";
in stdenv.mkDerivation rec {
  name = "snap-${version}";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "jb55";
    repo = "sharefile-snap";
    rev = "bad85582cea2eebcf677ed5b533716b7f235385f";
    sha256 = "05pjsbd1bjjvsjlq8xk87l8z3wbblr81161q5xl8bgl7v0rwn3x1";
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
