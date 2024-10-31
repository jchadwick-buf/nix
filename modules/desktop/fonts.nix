{ pkgs, ... }:
{
  config = {
    fonts.packages = with pkgs; [ (pkgs.nerdfonts.override { fonts = [ "Go-Mono" ]; }) ];
  };
}
