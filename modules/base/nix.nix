{ pkgs, inputs, ...}: {
  config = {
    services.nix-daemon.enable = true;
    nix.package = pkgs.nix;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.nixPath = [
      "nixpkgs=${inputs.nixpkgs.outPath}"
    ];
  };
}
