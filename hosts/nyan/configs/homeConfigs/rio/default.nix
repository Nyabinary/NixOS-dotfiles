{ lib, pkgs, ... }:
{
  programs.rio = {
    settings = {
      cursor = {
        shape = "block";
      };
      editor = {
        program = "hx";
        args = [ ];
      };
      use-fork = true;
      renderer = {
        performance = "High";
        backend = "Automatic";
        disable-unfocused-render = true;
      };
      keyboard = {
        use-kitty-keyboard-protocol = true;
      };
      shell = {
        program = (lib.getExe pkgs.nushell);
        args = [ ];
      };
    };
  };
}
