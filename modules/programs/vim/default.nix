{ pkgs, ... }:
{
  config = {
    programs.nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraPlugins = with pkgs.vimPlugins; [ vim-vsnip ];
    } // import ./config.nix;
  };
}
