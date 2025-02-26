{
  description = "My Nix configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim/nixos-24.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nix-rosetta-builder.url = "github:cpick/nix-rosetta-builder";
    nix-rosetta-builder.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    inputs@{
      home-manager,
      nix-darwin,
      nixvim,
      nix-rosetta-builder,
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
            { nix.linux-builder.enable = true; }
            nix-rosetta-builder.darwinModules.default
          ];
          specialArgs = {
            inherit inputs;
          };
        };
      };
    };
}
