{ stdenv
, lib
, fetchFromGitHub
, qmake
, qtbase
, wrapQtAppsHook
, python3
, dtkcore
}:

stdenv.mkDerivation rec {
  pname = "dde-qt-dbus-factory";
  version = "5.5.5";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = pname;
    rev = version;
    sha256 = "sha256-VFqlZMi0YjySGGmHs/gBLjLlhtzabo5vb1La5Z5cAuo=";
  };

  nativeBuildInputs = [
    qmake
    wrapQtAppsHook
    python3
  ];

  buildInputs = [
    qtbase
    dtkcore
  ];

  qmakeFlags = [
    "INSTALL_ROOT=${placeholder "out"}"
    "LIB_INSTALL_DIR=${placeholder "out"}/lib"
  ];

  meta = with lib; {
    description = "Repo of auto-generated D-Bus source code which DDE used";
    homepage = "https://github.com/linuxdeepin/deepin-qt-dbus-factory";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
