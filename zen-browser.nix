{
  fetchurl,
  appimageTools,
}:
let
  pname = "zen";
  version = "1.19.12b";

  src = fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/${version}/${pname}-x86_64.AppImage";
    hash = "sha256-MdeuOdpMUwjUSvTRSdXXcwJnbKeL3T5K0+K45IH5yis=";
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
