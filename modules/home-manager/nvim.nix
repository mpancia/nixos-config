{ pkgs, ... }:
let
fromGitHub = rev: owner: repo: name: hash:
pkgs.vimUtils.buildVimPlugin {
    pname = name;
    version = rev;
    src = pkgs.fetchFromGitHub {
        owner = owner;
        repo = repo;
        rev = rev;
        sha256 = hash;
    };
};

in {
    programs.neovim = {
        enable = true;
        coc.enable = false;
        defaultEditor = true;
        plugins =  (with pkgs.vimPlugins; [nvim-treesitter.withAllGrammars]);
        viAlias = true;
        vimAlias = true;
        withPython3 = true;
        vimdiffAlias = true;
    };
    xdg.configFile.nvim = {  
        source = ./neovim/config/lua;
        recursive = true;  
    };
}
