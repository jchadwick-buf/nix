{ pkgs, ... }: {
  imports = [
    ./kitty
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
      (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
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
