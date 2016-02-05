{ stdenv
, perlPackages
, makeWrapper
, perl
, rsync
, openssh
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  name = "sharefile-${version}";
  version = "1.0.0";
  buildInputs = [ perl perlPackages.URI makeWrapper rsync openssh ];

  src = fetchFromGitHub {
    rev = "02a6126a541a401273b14d95df57b2f57125e4b6";
    owner = "jb55";
    repo = "sharefile";
    sha256 = "108582jb6yam1dsgg3rp1gjsj9sr8xlczwqskk6kdifb8v2183rr";
  };

  installPhase = ''
    mkdir -p $out/bin

    cp sharefile $out/bin
    cp share_last_ss $out/bin

    for prog in $(echo "$out/bin/"*)
    do
      wrapProgram "$prog" \
        --prefix PERL5LIB : "$PERL5LIB" \
        --prefix PATH : "$out/bin:{perl}/bin"
    done
  '';
}
