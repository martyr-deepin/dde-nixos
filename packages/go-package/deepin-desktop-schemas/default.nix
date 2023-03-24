{ stdenv
, lib
, buildGoModule
, fetchFromGitHub
, go
, glib
}:
buildGoModule rec {
  pname = "deepin-desktop-schemas";
  version = "6.0.0";

  src = fetchFromGitHub {
    owner = "wineee";
    repo = pname;
    rev = "19b172d0479706614805cb082bf635269b28f054";
    sha256 = "sha256-LkGqP9fnV2+Lbl/QsEjOTSviujwxbiC86e6Gsc1GkyM=";
  };

  vendorSha256 = "sha256-IoJDa1YNGL18I5xQZBDds0muIu8yGXOV8SFQYiQSYdk=";

  postPatch = ''
    # Relocate files path for backgrounds and wallpapers
    for file in $(grep -rl "/usr/share")
    do
      substituteInPlace $file \
        --replace "/usr/share" "/run/current-system/sw/share"
    done

    substituteInPlace Makefile --replace "env GO111MODULE=off" " "
  '';

  buildPhase = ''
    runHook preBuild
    make ARCH=${stdenv.targetPlatform.linuxArch}
    runHook postBuild
  '';

  nativeCheckInputs = [ glib ];
  checkPhase = ''
    runHook preCheck
    glib-compile-schemas --dry-run result
    runHook postCheck
  '';

  installPhase = ''
    runHook preInstall
    make install DESTDIR="$out" PREFIX="/"
    runHook postInstall
  '';

  meta = with lib; {
    description = "GSettings deepin desktop-wide schemas";
    homepage = "https://github.com/linuxdeepin/deepin-desktop-schemas";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
  };
}
