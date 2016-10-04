{ mkDerivation, amazonka, amazonka-core, amazonka-s3, base
, base16-bytestring, bytestring, conduit-extra, cryptonite
, cryptonite-conduit, directory, filepath, http-types, lens
, postgresql-simple, process, scotty, stdenv, text, text-format
, transformers, unagi-chan, unix, xmlgen, time, blaze-builder, fetchgit
, youtube-dl, makeWrapper
}:
mkDerivation {
  pname = "hearpress";
  version = "0.1.0.0";
  src = fetchgit {
    url = http://git.zero.jb55.com/hearpress;
    rev = "bd95759708afdf8aa225e1020df1a6f98d828aba";
    sha256 = "1haq3vcrzi4sm92xb044wby1fp3qbwkfjw3fhzp8mjh5lq09nr1w";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    amazonka amazonka-core amazonka-s3 base base16-bytestring
    bytestring conduit-extra cryptonite cryptonite-conduit directory
    filepath http-types lens postgresql-simple process scotty text
    text-format transformers unagi-chan unix xmlgen time blaze-builder
  ];
  executableToolDepends = [ makeWrapper ];
  postInstall = ''
     wrapProgram $out/bin/hearpressd \
       --prefix PATH ":" "${youtube-dl}/bin"
  '';
  homepage = "https://hearpress.com";
  description = "Auditize media";
  license = stdenv.lib.licenses.unfree;
}
