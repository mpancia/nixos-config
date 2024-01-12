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
        plugins = (with pkgs.vimExtraPlugins; [
                todo-comments-nvim
                aerial-nvim
                lualine-nvim
                copilot-cmp
                diffview-nvim
                gitsigns-nvim
                gruvbox
                indent-blankline-nvim
                lspsaga-nvim
                nvim-lspconfig
                nvim-notify
                nvim-treesitter-context
                nvim-treesitter-textobjects
                nvim-treesitter-textsubjects
                nvim-web-devicons
                overseer-nvim
                plenary-nvim
                project-nvim
                telescope-nvim
                trouble-nvim
                undotree
                which-key-nvim
                (fromGitHub "2cd4e03372f7ee5692c8caa220f479ea07970f17" "ThePrimeagen"
                 "harpoon" "harpoon"
                 "sha256-MUIGRoaFcCqqFatfnFJpnEOUmSYJgV2+teU/NXj6kgY=")
                (fromGitHub "008d8d7f8218d38bf87ae4c3f61a42843c31a8f1" "linrongbin16"
                 "gitlinker.nvim" "gitlinker.nvim"
                 "sha256-ZEMK3t4rU5CZQLH8u6BGs9+rZmwTfDTWpRCdIERN7+8=")
                (fromGitHub "e578f353d0b1d9f21a9640458d8e506c0c9acf5e" "echasnovski"
                 "mini.nvim" "mini.nvim"
                 "sha256-pWMFMfQm70PV0gQGh46imNOr7lJmvXL/eB34BoFVuQQ=")
                (fromGitHub "92433164e2f7118d4122c7674c3834d9511722ba" "folke"
                 "noice.nvim" "noice.nvim"
                 "sha256-7lgJK5pkMqwIXNeBDsz4B8UAKnkpUvDrHdeG/aSFRzM=")
                (fromGitHub "1ee3fcc150207f33dba8c9b3f478e5a0148d661d" "nvim-neotest"
                 "neotest" "neotest"
                 "sha256-nXbpF1YhbS07Zm4pPxqv3jUfbYTeIx1bHzViY9v5B68=")
                (fromGitHub "e568da4b8b6da800bd9274f7b509c0da81fc8615" "radyz"
                 "telescope-gitsigns" "telescope-gitsigns"
                 "sha256-ULmo84ameJ4D62wrvsb+9YCUKGhOYpHvgIffGKF0Vo8=")
                (fromGitHub "760d6d74c328ce2a38b02677bf5161999b992da2" "NeogitOrg"
                 "neogit" "neogit" "sha256-dwbZzNLrzldz8wlV+2n/Gkz9LMAiHQPqKjJ3ZWzj0rA=")
                (fromGitHub "fed2c8389c148ff1dfdcdca63c2b48d08a50dea0" "ray-x"
                 "lsp_signature.nvim" "lsp_signature.nvim"
                 "sha256-4GcTfu7MRpZUi5dqewaddSvaOezRl9ROKrR7wnnLnKE=")
                (fromGitHub "dd63df1a4ed0ffe1458945ee50ecb1dd02b605ab" "aznhe21"
                 "actions-preview.nvim" "actions-preview.nvim"
                 "sha256-iXqs1+3z6ujm/6thDpbgoyWmUJ5Nd+D0zxAW4jc+T2c=")
                (fromGitHub "2888f3731e7c6fbc44651c7cc0aed8fb92b55087" "altermo"
                 "ultimate-autopair.nvim" "ultimate-autopair.nvim"
                 "sha256-ojia2nzoj9FEs8MECSBNSWkJb36WZ8h/EEZ6dsR7+QQ=")
                (fromGitHub "bfba257774f78de384cca898d88cc1bb14c5a228" "Bekaboo"
                 "dropbar.nvim" "dropbar.nvim"
                 "sha256-2OmVfrsZe2WSs9bhPDCjbjGyYh+G/doIn4+/SdfmlPs=")
                (fromGitHub "279b06d47a2105a405518e2aa3a484e48dfb7b1b" "rose-pine"
                 "neovim" "rose-pine"
                 "sha256-fXF1oGfqncxFDh79mX+Q3l8DKnepGSW78L94TImPWlM=")
                (fromGitHub "aad46274f09ba29933e4cef2257cdda5ec19cf7a" "mfussenegger"
                 "nvim-dap" "nvim-dap"
                 "sha256-Eon+YxYNzIYW8MeRu2qIrnM/txPvhKx3jvxlIjVo7yo=")
                (fromGitHub "86ac2bbc8a4da3f203e56d9303d6ed1d7e50c1f6" "nvim-neotest"
                 "neotest-python" "neotest-python"
                 "sha256-AJjsGuP6gAWT5EFrTDWwGg9j5bjkNOn+8Vl6HTY98AE=")
                (fromGitHub "091e4ae00a12085f9ed4200a3cd04af7179b8a23" "mfussenegger"
                 "nvim-dap-python" "nvim-dap-python"
                 "sha256-V/88NHqW/rpHWC2m1dnVZWo3Va7wSPqw3FpEM1+lKgo=")
                ]) ++ (with pkgs.vimPlugins; [
                    iron-nvim
                    marks-nvim
                    FixCursorHold-nvim
                    cmp-cmdline
                    neoconf-nvim
                    neodev-nvim
                    cmp-nvim-lsp
                    cmp-nvim-lua
                    cmp-path
                    cmp_luasnip
                    copilot-lua
                    flash-nvim
                    friendly-snippets
                    luasnip
                    nui-nvim
                    nvim-cmp
                    nvim-tree-lua
                    nvim-treesitter.withAllGrammars
                    oil-nvim
                    vim-repeat
                    ]);
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
