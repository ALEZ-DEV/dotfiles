{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
    settings = {
      hide_scroll = true;
      show = "drun";
      width = "30%";
      lines = 8;
      line_wrap = "word";
      term = "alacritty";
      allow_markup = true;
      always_parse_args = false;
      show_all = true;
      print_command = true;
      layer = "overlay";
      allow_images = true;
      sort_order = "alphabetical";
      gtk_dark = true;
      prompt = "";
      image_size = 20;
      display_generic = false;
      location = "center";
      key_expand = "Tab";
      insensitive = false;
    };
    style = ''
      * {
        font-family: FiraCode Nerd Font Mono;
        color: #e5e9f0;
        background: transparent;
      }

      #window {
        background: rgba(46, 46, 46, 0.85);
        margin: auto;
        padding: 10px;
        border-radius: 20px;
        border: 4px solid #ea9a97;
      }

      #input {
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 15px;
      }

      #outer-box {
        padding: 20px;
      }

      #img {
        margin-right: 6px;
      }

      #entry {
        padding: 10px;
        border-radius: 15px;
      }

      #entry:selected {
        background-color: #2e3440;
      }

      #text {
        margin: 2px;
      }
    '';
  };
}
