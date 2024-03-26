{ pkgs, ... }: {
  imports = [
    ./vim
  ];

  config = {
    environment.systemPackages = with pkgs; [
      # Utilities
      git
      jq
      yq
      ripgrep

      # Kubernetes
      k9s
    ];
  };
}
