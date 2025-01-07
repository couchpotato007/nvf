{
  description = "neovim with nvf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nvf = {
      url = "github:notashelf/nvf";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    packages."x86_64-linux" = let
      neovimConfigured = inputs.nvf.lib.neovimConfiguration {
        inherit (nixpkgs.legacyPackages."x86_64-linux") pkgs;
        modules = [
          ./config.nix
        ];
      };
    in {
      # Set the default package to the wrapped instance of Neovim.
      # This will allow running your Neovim configuration with
      # `nix run` and in addition, sharing your configuration with
      # other users in case your repository is public.
      default = neovimConfigured.neovim;
    };
  };
}
