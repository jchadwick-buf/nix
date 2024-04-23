{
  colorschemes = {
    dracula.enable = true;
  };
  plugins = {
    auto-session = {
      enable = true;
      extraOptions = {
        pre_save_cmds = [ "lua close_file_tree()" ];
        post_save_cmds = [ "lua open_file_tree()" ];
        post_restore_cmds = [ "lua open_file_tree()" ];
      };
    };
    chadtree = {
      enable = true;
    };
    fugitive = {
      enable = true;
    };
    bufferline = {
      enable = true;
      diagnostics = "nvim_lsp";
      offsets = [
        {
          filetype = "CHADTree";
          text = "File Explorer";
          text_align = "center";
          separator = true;
        }
      ];
      closeCommand = "";
      leftMouseCommand = "lua switch_to_buffer(%d)";
      rightMouseCommand = "";
      showBufferCloseIcons = false;
    };
    none-ls = {
      enable = true;
    };
    rust-tools = {
      enable = true;
    };
    lsp = {
      enable = true;
      servers = {
        gopls.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        nixd.settings.formatting.command = "nixfmt";
      };
    };
    lsp-format = {
      enable = true;
    };
    nvim-lightbulb = {
      enable = true;
    };
    lsp-lines = {
      enable = true;
    };
    nvim-cmp = {
      enable = true;
      extraOptions = {
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            })
          '';
        };
        completion.autocomplete = false;
        preselect = "cmp.PreselectMode.Item";
        sources = [ { name = "nvim_lsp"; } { name = "vsnip"; } ];
      };
    };
    cmp-vsnip = {
      enable = true;
    };
    cmp-nvim-lsp = {
      enable = true;
    };
    packer = {
      enable = true;
      plugins = [
        "tpope/vim-sleuth"
        "ntpeters/vim-better-whitespace"
        "knsh14/vim-github-link"
        "golang/vscode-go" # For snippets
      ];
    };
    telescope = {
      enable = true;
      keymaps = {
        "<C-p>" = {
          action = "git_files";
        };
      };
    };
  };
  extraConfigLua = builtins.readFile ./config.lua;
}
