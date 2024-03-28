{ pkgs, ... }: {
  config = {
    fonts.fontDir.enable = true;
    fonts.fonts = with pkgs; [
      (pkgs.nerdfonts.override { fonts = [
        "Go-Mono"
      ]; })
    ];
  };
}

