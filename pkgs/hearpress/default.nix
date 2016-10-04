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
    rev = "505b0bfbee9d09aa3f18531c9c22dce60fe18c9a";
    sha256 = "0627gambnv2017rc77isj9mfq2w5nxwxl6rx5qd840y8072xb1sj";
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
