{ stdenv
, lib
, fetchFromGitHub
, pkgconfig
, qmake
, gsettings-qt
, gtest
, wrapQtAppsHook
, lshw
, dtkcommon
, deepin-desktop-base
}:

stdenv.mkDerivation rec {
  pname = "dtkcore";
  version = "5.5.23";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = pname;
    rev = version;
    sha256 = "sha256-MFcZOjCrJGSXLMfmttWxbczebDvS5oW0NigECaQyHeQ=";
  };

  nativeBuildInputs = [
    qmake
    pkgconfig
    wrapQtAppsHook
  ];

  buildInputs = [
    gsettings-qt
    gtest
    lshw
    dtkcommon
    deepin-desktop-base
  ];

  qmakeFlags = [
    "DTK_VERSION=${version}"
    "LIB_INSTALL_DIR=${placeholder "out"}/lib"
    "MKSPECS_INSTALL_DIR=${placeholder "out"}/mkspecs"
  ];

  meta = with lib; {
    description = "Deepin tool kit core library";
    homepage = "https://github.com/linuxdeepin/dtkcore";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
