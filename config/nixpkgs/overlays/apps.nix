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

  Dash = self.installApplication rec {
    name = "Dash";
    version = "5.0.0";
    sourceRoot = "Dash.app";
    src = super.fetchurl {
      url = https://kapeli.com/downloads/v5/Dash.zip;
      sha256 = "1dizd4mmmr3vrqa5x4pdbyy0g00d3d5y45dfrh95zcj5cscypdg2";
    };
    description = "Dash is an API Documentation Browser and Code Snippet Manager";
    homepage = https://kapeli.com/dash;
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

  __1password = self.installApplication rec {
    name = "1Password";
    version = "7.0";
    sourceRoot = "1Password.app";
    src = super.fetchurl {
      name = "1Password";
      url = "https://c.1password.com/dist/1P/mac7/1Password-7.5.pkg";
      sha256 = "1abas7y2ivpjcfk9a7sbinpkfj5yqazv08p9pnd94amc06cpgilv";
    };
    description = "The Firefox web browser";
    homepage = https://www.mozilla.org/en-US/firefox/;
  };
}
