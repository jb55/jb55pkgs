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
    rev = "a4d8ce4a01d4d1fba041cf4a0247b07b44e154fb";
    sha256 = "0kni6y9wz9qbxlqxic0kj0jma8c1cqmm1jl82lqv1aspxn29q60y";
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
