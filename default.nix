{
  oath-toolkit,
  makeWrapper,
  stdenvNoCC,
  lib
}:
stdenvNoCC.mkDerivation {
  name = "hotp-counter";
  buildInputs = [ makeWrapper ];
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp hotp-counter $out/bin
    wrapProgram $out/bin/hotp-counter \
      --set PATH ${lib.strings.makeBinPath [ oath-toolkit ]}
  '';
}
