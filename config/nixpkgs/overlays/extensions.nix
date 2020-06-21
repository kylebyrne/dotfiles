self: super: {
  buildFirefoxXpiAddon =
    { pname, version, addonId, url, sha256, meta, ... }:
    with super; stdenv.mkDerivation {
      name = "${pname}-${version}";

      inherit meta;

      src = fetchurl {
        inherit url sha256;
      };

      preferLocalBuild = true;
      allowSubstitutes = false;

      buildCommand = ''
          dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
          mkdir -p "$dst"
          install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    };

    _1pass_extension = self.buildFirefoxXpiAddon {
      pname = "1password-x-password-manager";
      version = "1.19.2";
      addonId = "{d634138d-c276-4fc8-924b-40a0ea21d284}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3589872/1password_x_password_manager-1.19.2-fx.xpi?src=";
      sha256 = "866b106203925c91d744323af4b5ecfd95c72f4a9f0169c16ef5596f7348a5c0";
      meta = with super.stdenv.lib;
      {
        homepage = "https://1password.com";
        description = "The best way to experience 1Password in your browser. Easily sign in to sites, generate passwords, and store secure information, including logins, credit cards, notes, and more.";
        license = {
          shortName = "1pwd";
          fullName = "Service Agreement for 1Password users and customers";
          url = "https://1password.com/legal/terms-of-service/";
          free = false;
          };
        platforms = platforms.all;
        };
      };
}


