{
  description = "My Nix configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    inputs@{
      home-manager,
      nix-darwin,
      nixvim,
      ...
    }:
    {
      darwinConfigurations = {
        "Johns-MacBook-Pro" = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            home-manager.darwinModules.home-manager
            nixvim.nixDarwinModules.nixvim
            ./modules/machines/mbp
            ./modules/base
            ./modules/desktop
            ./modules/users
            ./modules/programs
            ./modules/programs/homebrew
          ];
          specialArgs = {
            inherit inputs;
          };
        };
      };
    };
}
