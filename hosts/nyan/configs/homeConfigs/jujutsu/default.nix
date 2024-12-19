{ ... }:
{
  programs.jujutsu = {
    settings = {
      user = {
        name = "Niko";
        email = "97130632+Nyabinary@users.noreply.github.com";
      };
      ui = {
        color = "auto";
        diff = {
          format = "color-words";
        };
        editor = "hx";
        log-word-wrap = true;
        paginate = "auto";
      };
    };
  };
}
