{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.homeModules.nushell = {
    enable = lib.mkEnableOption "Enable Nushell module";
    package = lib.mkPackageOption pkgs "direnv" { };
  };

  config = lib.mkIf config.homeModules.nushell.enable (
    let
      cfg = config.homeModules.nushell;
      direnvWrapped = pkgs.writeShellScript "direnv-wrapped" ''
        ${lib.getExe cfg.package} export json || true
      '';
    in
    {
      programs.nushell = {
        enable = true;
        environmentVariables = {
          NIXOS_OZONE_WL = "1";
          ELECTRON_OZONE_PLATFORM_HINT = "'auto'";
        };
        extraConfig = ''
          $env.config = {
            show_banner: false,
          }
        '';
      };
      home = {
        sessionVariables = {
          NIXOS_OZONE_WL = "1";
          ELECTRON_OZONE_PLATFORM_HINT = "auto";
        };
      };
      xdg.configFile."nushell/config.nu".text =
        builtins.readFile "${
          pkgs.fetchFromGitHub (
            with pkgs.nushell.src;
            {
              owner = owner;
              repo = repo;
              rev = rev;
              hash = outputHash;
            }
          )
        }/crates/nu-utils/src/sample_config/default_config.nu"
        + ''

          $env.config = {
            show_banner: false,
          }
          $env.config = ($env.config? | default {})
          $env.config.hooks = ($env.config.hooks? | default {})
          $env.config.hooks.pre_prompt = (
              $env.config.hooks.pre_prompt?
              | default []
              | append {||
                  let direnv = (
                      ${direnvWrapped}
                      | from json --strict
                      | default {}
                  )
                  if ($direnv | is-empty) {
                      return
                  }
                  $direnv
                  | items {|key, value|
                      {
                          key: $key
                          value: (do (
                              $env.ENV_CONVERSIONS?
                              | default {}
                              | get -i $key
                              | get -i from_string
                              | default {|x| $x}
                          ) $value)
                      }
                  }
                  | transpose -ird
                  | load-env
              }
          )
        '';
      xdg.configFile."nushell/env.nu".text =
        builtins.readFile "${
          pkgs.fetchFromGitHub (
            with pkgs.nushell.src;
            {
              owner = owner;
              repo = repo;
              rev = rev;
              hash = outputHash;
            }
          )
        }/crates/nu-utils/src/sample_config/default_env.nu"
        + ''

          $env.NIXOS_OZONE_WL = 1;
          $env.ELECTRON_OZONE_PLATFORM_HINT = "auto";
          $env.EDITOR = "hx";
          $env.VISUAL = "hx";
        '';
    }
  );
}
