{ stdenv, coreutils, sharefile, maim, libnotify, xclip, makeWrapper, fetchFromGitHub }:

let inputs = [ sharefile coreutils maim libnotify xclip ];
    buildPaths = sep: fmt:
      "${stdenv.lib.concatStringsSep sep (map fmt inputs)}";
in stdenv.mkDerivation rec {
  name = "snap-${version}";
  version = "1.2";

  src = fetchFromGitHub {
    rev = version;
    owner = "jb55";
    repo = "sharefile-snap";
    sha256 = "0csz4zsgcx2agww1lcm82lzw2v8bmwaszbbc99ml5fmqcdqyi6qb";
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
