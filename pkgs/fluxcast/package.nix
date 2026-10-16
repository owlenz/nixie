{
  lib,
  python3,
  makeWrapper,
  wrapGAppsHook4,
  gobject-introspection,
  gtk4,
  libadwaita,
  wf-recorder,
  pulseaudio,
  xrandr,
  dnsmasq,
  iw,
  glib,
  wpa_supplicant,
  networkmanager,
  ffmpeg,
  gst_all_1,
  fetchFromGitHub,
}:

let
  pythonEnv = python3.withPackages (
    ps: with ps; [
      pygobject3
      pycairo
      dbus-next
      upnpclient
      pychromecast
      pillow
      pystray
    ]
  );

  runtimeDeps = [
    wf-recorder
    pulseaudio
    xrandr
    dnsmasq
    iw
    glib
    wpa_supplicant
    networkmanager
    ffmpeg
    gst_all_1.gstreamer
  ];
in
python3.pkgs.buildPythonApplication {
  pname = "fluxcast";
  version = "dev";
  format = "other";
  src = fetchFromGitHub {
    owner = "IlyaP358";
    repo = "fluxcast";
    rev = "dc200eeb72ce8b372e2fc1270e81f1d331ed29f3";
    hash = "sha256-8dHZZPklhXGgRnqk4EXXzXmzYWsrR29Cfs++3GV5kI0=";
  };

  nativeBuildInputs = [
    makeWrapper
    wrapGAppsHook4
    gobject-introspection
  ];
  buildInputs = [
    gtk4
    libadwaita
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
  ];

  dontWrapGApps = true; # we combine the gapps args in the wrapper below

  installPhase = ''
    runHook preInstall
    mkdir -p $out/opt/fluxcast $out/bin
    cp -r src/. $out/opt/fluxcast/
    install -Dm644 meta/fluxcast.desktop -t $out/share/applications/
    install -Dm644 src/assets/flcast_logo_512x512.png \
      $out/share/icons/hicolor/512x512/apps/fluxcast.png
    install -Dm644 meta/zz-dev.fluxcast.wpa-supplicant.conf \
      -t $out/share/dbus-1/system.d/
    makeWrapper ${pythonEnv}/bin/python3 $out/bin/fluxcast \
      --add-flags "$out/opt/fluxcast/main.py" \
      --prefix PATH : ${lib.makeBinPath runtimeDeps} \
      "''${gappsWrapperArgs[@]}"
    runHook postInstall
  '';
}
