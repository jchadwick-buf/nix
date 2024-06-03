{
  pkgs,
  inputs,
  config,
  ...
}:
{
  config = {
    services.nix-daemon.enable = true;
    nix.package = pkgs.nix;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nix.nixPath = [
      "nixpkgs=${inputs.nixpkgs.outPath}"
      "unstable=${inputs.nixpkgsUnstable.outPath}"
    ];
    nix.registry.nixpkgs.flake = inputs.nixpkgs;
    nix.registry.unstable.flake = inputs.nixpkgsUnstable;
    nixpkgs.overlays = [
      (final: prev: { unstable = import inputs.nixpkgsUnstable { inherit (config.nixpkgs) system; }; })
    ];
  };
}
