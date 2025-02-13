{
  pkgs,
  ...
}:
{
  imports = [
    ./kitty
    ./vim
  ];

  config =
    let
      # macOS devs REEEEEEEEEEEEEE
      ggrep = pkgs.runCommand "ggrep" { } ''
        mkdir -p $out/bin
        ln -s ${pkgs.gnugrep}/bin/grep $out/bin/ggrep
      '';
      bazel = pkgs.runCommand "bazel" { } ''
        mkdir -p $out/bin
        ln -s ${pkgs.bazelisk}/bin/bazelisk $out/bin/bazel
      '';
    in
    {
      programs.nix-index.enable = true;
      environment.systemPackages = [
        # Utilities
        bazel
        pkgs.aria2
        pkgs.comma
        pkgs.git
        pkgs.unstable.gitu
        ggrep
        pkgs.gnugrep
        pkgs.jq
        pkgs.yq
        pkgs.ripgrep
        pkgs.nixfmt-rfc-style
        pkgs.xcodes
        pkgs.python312Full

        # Kubernetes
        pkgs.k9s

        # Cloud
        pkgs.awscli2
        (pkgs.google-cloud-sdk.withExtraComponents [
          pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
        ])
        pkgs.google-cloud-sql-proxy

        # Go toolchain
        pkgs.unstable.go_1_23
        pkgs.unstable.gopls
        pkgs.unstable.buf
      ];

      environment.variables = {
        EDITOR = "vim";
        GOPATH = "$HOME/Go";
      };
    };
}
