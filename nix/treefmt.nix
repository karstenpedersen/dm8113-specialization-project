{pkgs, ...}: {
  projectRootFile = "flake.nix";
  programs = {
    terraform.enable = true;
    terraform.package = pkgs.opentofu;
    gleam.enable = true;
    gofmt.enable = true;
    alejandra.enable = true;
    jsonfmt.enable = true;
    typstyle.enable = true;
    mdformat.enable = true;
  };
}
