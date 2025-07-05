{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname = "lsr-cache";
  version = "1.0.0";
  doCheck = false;
  src = ../.;

  nativeBuildInputs = with pkgs; [ zig ];

  buildPhase = ''
    export ZIG_GLOBAL_CACHE_DIR=$(mktemp -d)
    zig build --fetch --summary none
  '';

  installPhase = ''
    mv $ZIG_GLOBAL_CACHE_DIR/p $out
  '';

  outputHash = "sha256-bfc2dlQa1VGq9S6OBeQawAJuvfxU4kgFtQ13fuKhdZc=";
  outputHashMode = "recursive";
  outputHashAlgo = "sha256";
}
