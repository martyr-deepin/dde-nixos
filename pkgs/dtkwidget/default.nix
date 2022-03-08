{ stdenv
, lib
, fetchFromGitHub
, pkgconfig
, qmake
, qttools
, qtmultimedia
, qtsvg
, qtx11extras
, wrapQtAppsHook
, cups
, gtest
, gsettings-qt
, librsvg
, libstartup_notification
, dtkcore
, dtkgui
, dtkcommon
, dde-qt-dbus-factory
}:

stdenv.mkDerivation rec {
  pname = "dtkwidget";
  version = "5.5.37";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = pname;
    rev = version;
    sha256 = "sha256-pvn1FEbSPdOOy5qE/e0mz/g4JwPj9Om3iqxmydsjxg8=";
  };

  nativeBuildInputs = [
    qmake
    pkgconfig
    wrapQtAppsHook
  ];

  buildInputs = [
    qttools
    qtmultimedia
    qtsvg
    qtx11extras

    cups
    gtest
    gsettings-qt
    librsvg
    libstartup_notification

    dtkcore
    dtkgui
    dtkcommon
    dde-qt-dbus-factory
  ];

  qmakeFlags = [
    "PREFIX=${placeholder "out"}"
    "LIB_INSTALL_DIR=${placeholder "out"}/lib"
    "INCLUDE_INSTALL_DIR=${placeholder "out"}/include"
    "MKSPECS_INSTALL_DIR=${placeholder "out"}/mkspecs"
  ];

  meta = with lib; {
    description = "Deepin graphical user interface library";
    homepage = "https://github.com/linuxdeepin/dtkwidget";
    license = licenses.lgpl3Plus;
    platforms = platforms.linux;
  };
}
