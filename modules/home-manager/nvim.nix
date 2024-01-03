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
      ];
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    vimdiffAlias = true;
    extraConfig = ''
      set tabstop=4
      set shiftwidth=4
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

      if exists('g:vscode')
        nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
        xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
        nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
        xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
        nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
        xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
        nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
        xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
        nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>
        nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
        xnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
      endif 

      :luafile ~/.config/nvim/lua/init.lua

    '';
  };
  xdg.configFile.nvim = {
    source = ./neovim;
    recursive = true;
  };
}
