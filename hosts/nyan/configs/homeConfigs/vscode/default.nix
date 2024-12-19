{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.vscode = {
    userSettings = {
      "diffEditor.experimental.showMoves" = true;
      "direnv.restart.automatic" = true;
      "editor.accessibilitySupport" = "off";
      "editor.experimental.asyncTokenization" = true;
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.smoothScrolling" = true;
      "git.enableCommitSigning" = true;
      "http.experimental.systemCertificatesV2" = true;
      "js/ts.implicitProjectConfig.experimentalDecorators" = true;
      # "languageToolLinter.external.apiKey" = config.sops.secrets.users_nyan_languagetool_api_key.path;
      "languageToolLinter.external.url" = "https://api.languagetoolplus.com/v2/";
      # "languageToolLinter.external.username" = config.sops.secrets.users_nyan_email.path;
      "languageToolLinter.languageTool.level" = "picky";
      "languageToolLinter.lintOnChange" = true;
      "languageToolLinter.lintOnOpen" = true;
      "languageToolLinter.smartFormat.onSave" = true;
      "languageToolLinter.smartFormat.onType" = true;
      "multiDiffEditor.experimental.enabled" = true;
      "nix.enableLanguageServer" = true;
      "nix.formatterPath" = lib.getExe pkgs.nixfmt-rfc-style;
      "nix.serverPath" = lib.getExe pkgs.nil;
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [
              "nix"
              "fmt"
              "--"
              "--"
            ];
          };
        };
      };
      "notebook.experimental.cellChat" = true;
      "notebook.globalToolbarShowLabel" = "dynamic";
      "notebook.stickyScroll.enabled" = true;
      "remote.SSH.enableRemoteCommand" = true;
      "remote.SSH.externalSSH_ASKPASS" = true;
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.diagnostics.experimental.enable" = true;
      "rust-analyzer.inlayHints.lifetimeElisionHints.enable" = "skip_trivial";
      "rust-analyzer.interpret.tests" = true;
      "rust-analyzer.restartServerOnConfigChange" = true;
      "rust-analyzer.rustfmt.rangeFormatting.enable" = true;
      "search.experimental.closedNotebookRichContentResults" = true;
      "search.quickAccess.preserveInput" = true;
      "telemetry.telemetryLevel" = "off";
      "terminal.external.linuxExec" = "rio";
      "terminal.integrated.defaultProfile.linux" = "Nushell";
      "terminal.integrated.smoothScrolling" = true;
      "terminal.integrated.stickyScroll.enabled" = true;
      "terminal.integrated.suggest.enabled" = true;
      "timeline.pageOnScroll" = true;
      "typescript.tsserver.experimental.enableProjectDiagnostics" = true;
      "window.autoDetectColorScheme" = true;
      "workbench.accounts.experimental.showEntitlements" = true;
      "workbench.commandPalette.experimental.suggestCommands" = true;
      "workbench.experimental.cloudChanges.autoStore" = "onShutdown";
      "workbench.experimental.cloudChanges.partialMatches.enabled" = true;
      "workbench.experimental.share.enabled" = true;
      "workbench.list.smoothScrolling" = true;
    };
  };
}
