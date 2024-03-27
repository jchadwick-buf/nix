{ pkgs, ... }: {
  imports = [
    ./vim
  ];

  config = {
    programs.nix-index.enable = true;
    environment.systemPackages = with pkgs; [
      # Utilities
      git
      jq
      yq
      ripgrep

      # Kubernetes
      k9s

      # Cloud
      awscli2
      google-cloud-sdk
      google-cloud-sql-proxy

      # Go toolchain
      unstable.go
      unstable.gopls
    ];

    environment.variables = {
      EDITOR = "vim";
      GOPATH = "$HOME/Go";
    };
  };
}
