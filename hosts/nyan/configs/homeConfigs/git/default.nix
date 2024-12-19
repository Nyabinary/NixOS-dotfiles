{ lib, pkgs, ... }:
{
  home.file.".ssh/allowed_signers".text =
    "* sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIPhf/YZshLyqaXMjrGVVyaTKLqdPO5EinWRqpGmHX1SwAAAABHNzaDo=";
  programs.git = {
    package = pkgs.gitFull;
    userName = "Niko Cantero";
    userEmail = "97130632+nyabinary@users.noreply.github.com";
    delta = {
      enable = true;
    };
    signing = {
      key = "~/.ssh/id_ed25519_sk.pub";
      signByDefault = true;
    };
    extraConfig = {
      core = {
        editor = lib.getExe pkgs.helix;
      };
      credential = {
        helper = [
          "${lib.getExe' pkgs.gitFull "git-credential-libsecret"}"
        ];
      };
      gpg = {
        ssh = {
          allowedSignersFile = "~/.ssh/allowed_signers";
        };
        format = "ssh";
      };
    };
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
    settings = {
      editor = lib.getExe pkgs.helix;
    };
  };
  programs.git-credential-oauth = {
    enable = true;
  };
}
