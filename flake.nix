{
  description = "Lean 4 Example Project";

  inputs = {
    nixpkgs.follows = "lean4-nix/nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs @ { nixpkgs, flake-parts, systems, ... }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem = {
        pkgs,
        ...
      }: {
        treefmt.config = {
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
            gofmt.enable = true;
          };
        };

        devShells.default = pkgs.mkShell {
          name = "dev";

          packages = with pkgs; [
            # Go
            go
            gotools
            gdlv
            delve

            # Typst
            typst
            tinymist

            # Kubernetes
            kubectl
            k9s
            kind
            minikube

            # Pulumi
            pulumi
            pulumiPackages.pulumi-go

            # Terraform
            terraform

            # OpenTofu
            opentofu

            # More
            just
          ];

          shellHook = ''
            echo ""
            echo "Specalization Project Environment"
            echo ""
          '';
        };
      };
    };
}
