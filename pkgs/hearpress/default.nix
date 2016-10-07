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
    rev = "4a9610c23bb57cea9322c6c97830cfe018b81e71";
    sha256 = "1bhy8i9zqllysbm88cfpiicn3j5avndim08c9cwx0050b9rxn7ay";
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
