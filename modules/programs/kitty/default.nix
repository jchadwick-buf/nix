{ pkgs, ... }:
{
  config = {
    # Using the Cask because signing is broken on macOS again.
    environment.etc."xdg/kitty/kitty.conf".source = ./kitty.conf;
  };
}
