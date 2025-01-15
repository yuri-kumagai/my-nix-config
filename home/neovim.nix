{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    coc.enable = true;
    coc.settings = {
      languageserver = {
        fsharp = {
          command = "fsautocomplete";
          args = [];
	        filetypes = ["fsharp"];
	        trace.server = "verbose";
	        initializationOptions = {
	          AutomaticWorkspaceInit = true;
          };
          settings = {
            FSharp.keywordsAutocomplete = true;
            Fsharp.ExternalAutocomplete = false;
            FSharp.Linter = true;
            FSharp.UnusedOpensAnalyzer = true;
            FSharp.UnusedDeclarationsAnalyzer = true;
            FSharp.UseSdkScripts = true;
            FSharp.SimplifyNameAnalyzer = false;
            FSharp.ResolveNamespaces = true;
            FSharp.EnableReferenceCodeLens = true;
          };
        };
      };
      fsharp.formatting = {
        command = "fantomas";
        args = ["--stdout" "--indent" "4" "%filepath"];
      };
      coc.preferences.formatOnSaveFiletypes = ["fsharp"];
    };
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      catppuccin-nvim
      which-key-nvim
      lazygit-nvim
      telescope-nvim
    ];
    extraLuaConfig = ''
      vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.softtabstop = 2

      vim.cmd('colorscheme catppuccin-frappe')

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "fsharp",
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end,
      })
      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true,
        },
      }
    '';
  };
}
