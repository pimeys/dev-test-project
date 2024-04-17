{
  description = "Julius Test project";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/master";
  inputs.devshell.url = "github:numtide/devshell";
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";

  outputs = inputs @ {
    self,
    flake-parts,
    devshell,
    nixpkgs,
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        devshell.flakeModule
      ];

      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "i686-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem = {pkgs, ...}: {
        devshells.default = {
          commands = [
            {
              package = pkgs.bun;
              category = "development";
            }
            {
              package = pkgs.nodejs;
              category = "development";
            }
            {
              package = pkgs.nodePackages.npm;
              category = "development";
            }
            {
              package = pkgs.rover;
              category = "development";
            }
          ];
        };
      };
    };
}
