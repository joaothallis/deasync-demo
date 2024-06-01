{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    elixir_1_16
    cyrus_sasl
    lz4
    rdkafka
    zlib
    curl
  ];
}
