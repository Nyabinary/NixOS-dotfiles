{ lib, pkgs, ... }:
{
  programs.helix = {
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        auto-completion = true;
        auto-format = true;
        auto-save = true;
        line-number = "relative";
        undercurl = true;
        true-color = true;
        lsp = {
          enable = true;
          snippets = true;
          display-messages = true;
          auto-signature-help = true;
          display-inlay-hints = true;
          display-signature-help-docs = true;
          goto-reference-include-declaration = true;
        };
        indent-guides = {
          render = true;
        };
        soft-wrap = {
          enable = true;
        };
      };
    };
    defaultEditor = true;
    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "nix";
          auto-format = true;
        }
      ];
      language-server = {
        rust-analyzer.config = {
          rustfmt = {
            rangeFormatting = {
              enable = true;
            };
          };
          diagnostics = {
            experimental = {
              enable = true;
            };
          };
          check = {
            command = "clippy";
          };
          interpret = {
            tests = true;
          };
        };
        nil = {
          command = lib.getExe pkgs.nil;
          config.nil.formatting.command = [
            (lib.getExe pkgs.nixfmt-rfc-style)
            "-q"
          ];
        };
      };
    };
    extraPackages = [ pkgs.wl-clipboard ];
  };
}
