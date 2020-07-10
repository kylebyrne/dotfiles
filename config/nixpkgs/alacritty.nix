{
  env = {
    "TERM" = "xterm-256color";
  };

  background_opacity = 0.95;

  window = {
    padding.x = 10;
    padding.y = 10;
    decorations = "buttonless";
  };

  key_bindings = [
    {
      key = "Key3";
      mods = "Alt";
      chars = "#";
    }
  ];

  font = {
    size = 11.0;
    use_thin_strokes = true;

    normal.family = "JetBrains Mono";
    bold.family = "JetBrains Mono";
    italic.family = "JetBrains Mono";

    offset.x = 0;
    offset.y = 1;
  };

  shell = {
    program = "zsh";
  };

  colors = {
    # Default colors
    primary = {
      background = "0x282c36";
      foreground = "0xeff0eb";
    };

    # Normal colors
    normal = {
      black=   "0x282a36";
      red=     "0xff5c57";
      green=   "0x5af78e";
      yellow=  "0xf3f99d";
      blue=    "0x57c7ff";
      magenta= "0xff6ac1";
      cyan=    "0x9aedfe";
      white=   "0xf1f1f0";
    };

    # Bright colors
    bright = {
      black=   "0x686868";
      red=     "0xff5c57";
      green=   "0x5af78e";
      yellow=  "0xf3f99d";
      blue=    "0x57c7ff";
      magenta= "0xff6ac1";
      cyan=    "0x9aedfe";
      white=   "0xf1f1f0";
    };
  };
}
