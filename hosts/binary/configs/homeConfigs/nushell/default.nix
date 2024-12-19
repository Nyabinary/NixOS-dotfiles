{ ... }:
{
  programs.nushell = {
    environmentVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
    shellAliases = {
      switch = "sudo nixos-rebuild switch";
      boot = "sudo nixos-rebuild boot";
    };
  };
  home = {
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
    shellAliases = {
      switch = "sudo nixos-rebuild switch";
      boot = "sudo nixos-rebuild boot";
    };
  };
}
