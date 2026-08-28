{
  description = "DM8113 Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    git-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
    treefmt-nix,
    git-hooks,
  }: let
    eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

    treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./nix/treefmt.nix);
  in {
    devShells = eachSystem (pkgs: {
      default = let
        inherit (self.checks.${pkgs.system}.pre-commit-check) shellHook enabledPackages;
      in
        pkgs.mkShell {
          packages =
            enabledPackages
            ++ [
              # Gleam
              pkgs.gleam
              pkgs.erlang
              pkgs.rebar3

              # Go
              pkgs.go
              pkgs.gotools
              pkgs.gdlv
              pkgs.delve

              # Typst
              pkgs.typst
              pkgs.tinymist

              # Kubernetes
              pkgs.kubectl
              pkgs.k9s
              pkgs.kind
              pkgs.minikube

              # Pulumi
              pkgs.pulumi
              pkgs.pulumiPackages.pulumi-go

              # Terraform
              # terraform

              # OpenTofu
              pkgs.opentofu

              # Tools
              pkgs.trivy

              # More
              pkgs.just
              pkgs.prek
              pkgs.commitizen
              treefmtEval.${pkgs.system}.config.build.wrapper
            ];

          shellHook = ''
            ${self.checks.${pkgs.system}.pre-commit-check.shellHook}
            echo ""
            echo "DM8113: Specalization Project Environment"
            echo ""
          '';
        };
    });

    formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);

    checks = eachSystem (pkgs: {
      formatting = treefmtEval.${pkgs.system}.config.build.check self;
      pre-commit-check = git-hooks.lib.${pkgs.system}.run {
        src = ./.;
        hooks = {
          treefmt = {
            enable = true;
            package = treefmtEval.${pkgs.system}.config.build.wrapper;
          };
          actionlint.enable = true;
          terraform-validate.enable = true;
          check-added-large-files.enable = true;
          check-merge-conflicts.enable = true;
          check-yaml.enable = true;
          check-toml.enable = true;
          check-json.enable = true;
          commitizen.enable = true;
          pre-commit-hook-ensure-sops.enable = true;
        };
      };
    });
  };
}
