{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {nixpkgs, ...} @ inputs: {
    packages.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      default =
        (inputs.nvf.lib.neovimConfiguration {
          pkgs = pkgs;
          modules = [
            ./config.nix
          ];
        })
        .neovim;

      yazi = pkgs.yazi;
    };
  };
}
