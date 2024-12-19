{ ... }:
{
  home.file.".ssh/allowed_signers".text =
    "* sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIJ9Y83WBlJCwBmB9evuvrbMlb+ynHKNb+FgUlg5m9EhMAAAABHNzaDo=";
  programs.git = {
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
      credential = {
        helper = "store";
      };
      gpg = {
        ssh = {
          allowedSignersFile = "~/.ssh/allowed_signers";
        };
        format = "ssh";
      };
    };
  };
}
