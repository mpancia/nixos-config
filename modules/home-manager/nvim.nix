{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    coc.enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins;
      with pkgs.vimExtraPlugins; [
        vim-easymotion
        vim-commentary
        vim-sandwich
        lsp-zero-nvim
        plenary-nvim
        telescope-nvim
      ];
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    vimdiffAlias = true;
    extraConfig = ''
      highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
      highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline
      highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
      highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=none

      map  <Leader>f <Plug>(easymotion-bd-f)
      nmap <Leader>f <Plug>(easymotion-overwin-f)

      nmap s <Plug>(easymotion-overwin-f2)

      map <Leader>L <Plug>(easymotion-bd-jk)
      nmap <Leader>L <Plug>(easymotion-overwin-line)

      map  <Leader>w <Plug>(easymotion-bd-w)
      nmap <Leader>w <Plug>(easymotion-overwin-w)


      :luafile ~/.config/nvim/lua/init.lua

    '';
  };
  xdg.configFile.nvim = {
    source = ./neovim;
    recursive = true;
  };
}
