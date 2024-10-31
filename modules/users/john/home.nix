{
  home.stateVersion = "23.11";
  programs = {
    zsh.enable = true;
    zsh.oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "man"
      ];
      theme = "agnoster";
    };
    direnv.enable = true;
  };
}
