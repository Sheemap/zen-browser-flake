{
  fetchurl,
  appimageTools,
}:
let
  pname = "zen";
  version = "1.17.14b";

  src = fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/${version}/${pname}-x86_64.AppImage";
    hash = "sha256-JrkjLgpM31U2gZ5lzm8L8ZFoHtRWQ4U2ZwJDIk7vy8I=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands =
    let
      contents = appimageTools.extract { inherit pname version src; };
    in
    ''
      install -m 444 -D ${contents}/zen.desktop -t $out/share/applications

      cp -r ${contents}/usr/share/* $out/share
    '';
}
