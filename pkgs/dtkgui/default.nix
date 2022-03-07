{ stdenv
, lib
, fetchFromGitHub
, pkgconfig
, qmake
, qttools
, gtest
, wrapQtAppsHook
, librsvg
, dtkcore
, dtkcommon
}:

stdenv.mkDerivation rec {
  pname = "dtkgui";
  version = "5.5.21";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = pname;
    rev = version;
    sha256 = "sha256-rHViFD7ol9xJgbiU3nnVBA5kjFabwAbLVaceS2/GxiM=";
  };

  nativeBuildInputs = [
    qmake
    pkgconfig
    wrapQtAppsHook
  ];

  buildInputs = [
    qttools
    librsvg
    gtest
    dtkcore
    dtkcommon
  ];

  qmakeFlags = [
    "DTK_VERSION=${version}"
    "LIB_INSTALL_DIR=${placeholder "out"}/lib"
    "MKSPECS_INSTALL_DIR=${placeholder "out"}/mkspecs"
  ];

  meta = with lib; {
    description = "Deepin Toolkit, gui module for DDE look and feel";
    homepage = "https://github.com/linuxdeepin/dtkgui";
    license = licenses.lgpl3Plus;
    platforms = platforms.linux;
  };
}
