# Thanks Jwiegley https://github.com/jwiegley/nix-config/blob/master/overlays/30-apps.nix
self: super: {

  installApplication = 
  { name, appname ? name, version, src, description, homepage, 
  postInstall ? "", sourceRoot ? ".", ... }:
  with super; stdenv.mkDerivation {
    name = "${name}-${version}";
    version = "${version}";
    src = src;
    buildInputs = [ undmg unzip ];
    sourceRoot = sourceRoot;
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p "$out/Applications/${appname}.app"
      cp -pR * "$out/Applications/${appname}.app"
    '' + postInstall;
    meta = with stdenv.lib; {
      description = description;
      homepage = homepage;
      maintainers = with maintainers; [ jwiegley ];
      platforms = platforms.darwin;
    };
  };

  Firefox = self.installApplication rec {
    name = "Firefox";
    version = "77.0";
    sourceRoot = "Firefox.app";
    src = super.fetchurl {
      name = "Firefox-${version}.dmg";
      url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/mac/en-US/Firefox%20${version}.dmg";
      sha256 = "0w368pgz5j580ivbn14331d2r0ylhiydzp49cvl4kjvzxsrka5xy";
    };
    description = "The Firefox web browser";
    homepage = https://www.mozilla.org/en-US/firefox/;
  };

  Hammerspoon = self.installApplication rec {
    name = "Hammerspoon";
    version = "0.9.76";
    src = super.fetchurl {
      url = "https://github.com/Hammerspoon/hammerspoon/releases/download/${version}/Hammerspoon-${version}.zip";
      sha256 = "1r6mjn2cafdyrwqrnfi74cm4wy0fns44j30rsy31800kmqi9ifdb";
    };
    description = "Staggeringly powerful macOS desktop automation with Lua";
    homepage = "https://www.hammerspoon.org";
  };
}
