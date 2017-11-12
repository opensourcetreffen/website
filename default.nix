{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "open-source-treffen_website";
  src = ./.;

  buildInputs = with pkgs; [
    nodejs
  ];

  buildPhase = ''
    HOME=. npm install
    npm run compile
  '';

  installPhase = ''
    mkdir $out
    cp -r www/* $out
  '';
}
