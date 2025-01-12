{
  pkgs,
  system,
}:
let
  pname = "zen";
  version = "1.6b";

  shortSystem = builtins.replaceStrings [ "-linux" ] [ "" ] system;
  src = pkgs.fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen-${shortSystem}.AppImage";
    hash = "sha256-9HxRnx4dQmvEqOdVI870TaXEko9PqK2srhg4IlUwSps=";
  };
in

pkgs.buildFHSEnv {
  inherit pname version src;

  runScript = "appimage-run ${src} --";

  targetPkgs =
    pkgs:
    [ pkgs.appimage-run ]
    ++ pkgs.appimageTools.defaultFhsEnvArgs.targetPkgs pkgs
    ++ (with pkgs; [
      libGL
      libGLU
      libevent
      libffi
      libjpeg
      libpng
      libstartup_notification
      libvpx
      libwebp
      stdenv.cc.cc
      fontconfig
      libxkbcommon
      zlib
      freetype
      gtk3
      libxml2
      dbus
      xcb-util-cursor
      alsa-lib
      libpulseaudio
      pango
      atk
      cairo
      gdk-pixbuf
      glib
      udev
      libva
      mesa
      libnotify
      cups
      pciutils
      ffmpeg
      libglvnd
      pipewire
    ])
    ++ (with pkgs.xorg; [
      libxcb
      libX11
      libXcursor
      libXrandr
      libXi
      libXext
      libXcomposite
      libXdamage
      libXfixes
      libXScrnSaver
    ]);

  meta = with pkgs.lib; {
    description = "Experience tranquillity while browsing the web without people tracking you!";
    homepage = "https://github.com/zen-browser/desktop";
    license = licenses.mpl20;
    maintainers = [ ];
    platforms = [
      "x86_64-linux"
      "aarch64"
    ];
    mainProgram = "zen";
  };
}
