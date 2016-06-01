{ stdenv, fetchFromGitHub, autoconf, automake, libtool, ... }:

stdenv.mkDerivation rec {
  name = "secp256k1";

  src = fetchFromGitHub {
    owner = "bitcoin-core";
    repo = "secp256k1";
    rev = "b3be8521e694eaf45dd29baea035055183c42fe2";
    sha256 = "1pgsy72w87yxbiqn96hnm8alsfx3rj7d9jlzdsypyf6i1rf6w4bq";
  };

  buildInputs = [ autoconf automake libtool ];

  configureFlags = [ "--enable-module-recovery" ];

  preConfigure = "./autogen.sh";

  # The python wrapper requires autogen.sh to be there
  postInstall = "cp autogen.sh $out/lib";
}
