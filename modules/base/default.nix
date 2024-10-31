{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./nix.nix
    ./shell.nix
  ];
}
