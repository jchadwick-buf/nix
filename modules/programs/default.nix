{ pkgs, ... }: {
  imports = [
    ./kitty
    ./vim
  ];

  config =
  let
    # macOS devs REEEEEEEEEEEEEE
    ggrep = pkgs.runCommand "ggrep" {} ''
      mkdir -p $out/bin
      ln -s ${pkgs.gnugrep}/bin/grep $out/bin/ggrep
    '';
  in {
    programs.nix-index.enable = true;
    environment.systemPackages = with pkgs; [
      # Utilities
      comma
      git
      ggrep
      gnugrep
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
      unstable.buf
    ];

    environment.variables = {
      EDITOR = "vim";
      GOPATH = "$HOME/Go";
    };
  };
}
