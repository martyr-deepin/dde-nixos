{ stdenv
, lib
, fetchFromGitHub
, qmake
, pkgconfig
, qtbase
, qtx11extras
, wrapQtAppsHook
, mtdev
, cairo
, xorg
}:

stdenv.mkDerivation rec {
  pname = "qt5platform-plugins";
  version = "5.0.46";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = pname;
    rev = version;
    sha256 = "sha256-7zAkN6xX10XARCbSYPRl1qSn2vuuBM10CL7DvdjKEa0=";
  };

  nativeBuildInputs = [ qmake pkgconfig wrapQtAppsHook ];

  buildInputs = [
    mtdev
    cairo
    qtbase
    qtx11extras
    xorg.libSM
  ];

  qmakeFlags = [
    "PREFIX=${placeholder "out"}"
  ];

  postPatch = ''
    rm -r xcb/libqt5xcbqpa-dev/
    mkdir -p xcb/libqt5xcbqpa-dev/${qtbase.version}
    cp -r ${qtbase.src}/src/plugins/platforms/xcb/*.h xcb/libqt5xcbqpa-dev/${qtbase.version}/
  ''
  + ''
    rm -r wayland
    sed -i '/wayland/d' qt5platform-plugins.pro
  '';

  meta = with lib; {
    description = "Qt platform plugins for DDE";
    homepage = "https://github.com/linuxdeepin/qt5platform-plugins";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
