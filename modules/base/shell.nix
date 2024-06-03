{ pkgs, ... }:
{
  config = {
    programs.zsh = {
      enable = true;
      interactiveShellInit = ''
        autoload -U up-line-or-beginning-search
        autoload -U down-line-or-beginning-search
        zle -N up-line-or-beginning-search
        zle -N down-line-or-beginning-search

        # Key bindings
        # Based on https://wiki.archlinux.org/title/Zsh#Key_bindings
        typeset -g -A key
        key[Up]="^[[A"
        key[Down]="^[[B"
        key[Right]="^[[C"
        key[Left]="^[[D"
        key[Home]="''${terminfo[khome]}"
        key[End]="''${terminfo[kend]}"
        key[Insert]="''${terminfo[kich1]}"
        key[Backspace]="''${terminfo[kbs]}"
        key[Delete]="''${terminfo[kdch1]}"
        key[PageUp]="''${terminfo[kpp]}"
        key[PageDown]="''${terminfo[knp]}"
        key[Shift-Tab]="''${terminfo[kcbt]}"
        [[ -n "''${key[Home]}"      ]] && bindkey -- "''${key[Home]}"       beginning-of-line
        [[ -n "''${key[End]}"       ]] && bindkey -- "''${key[End]}"        end-of-line
        [[ -n "''${key[Insert]}"    ]] && bindkey -- "''${key[Insert]}"     overwrite-mode
        [[ -n "''${key[Backspace]}" ]] && bindkey -- "''${key[Backspace]}"  backward-delete-char
        [[ -n "''${key[Delete]}"    ]] && bindkey -- "''${key[Delete]}"     delete-char
        [[ -n "''${key[Up]}"        ]] && bindkey -- "''${key[Up]}"         up-line-or-beginning-search
        [[ -n "''${key[Down]}"      ]] && bindkey -- "''${key[Down]}"       down-line-or-beginning-search
        [[ -n "''${key[Left]}"      ]] && bindkey -- "''${key[Left]}"       backward-char
        [[ -n "''${key[Right]}"     ]] && bindkey -- "''${key[Right]}"      forward-char
        [[ -n "''${key[PageUp]}"    ]] && bindkey -- "''${key[PageUp]}"     beginning-of-buffer-or-history
        [[ -n "''${key[PageDown]}"  ]] && bindkey -- "''${key[PageDown]}"   end-of-buffer-or-history
        [[ -n "''${key[Shift-Tab]}" ]] && bindkey -- "''${key[Shift-Tab]}"  reverse-menu-complete
        # Add .local/bin folder to $PATH
        export PATH="$PATH:$HOME/.local/bin"
        # Enable colorized output in coreutils
        export CLICOLOR=1
      '';
      promptInit = ''
        autoload -U promptinit
        promptinit
        prompt redhat
        setopt prompt_sp
      '';
    };
    programs.direnv = {
      enable = true;
    };
  };
}
