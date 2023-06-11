{
	description = "Installing packages for kubernetes development on MacOS";

	inputs = {
	  nixpkgs = {
	    url = "github:NixOS/nixpkgs";
		};
  };

  outputs = {self, nixpkgs}: {
    packages.x86_64-darwin.bash = nixpkgs.legacyPackages.x86_64-darwin.bash;
    packages.x86_64-darwin.gnused = nixpkgs.legacyPackages.x86_64-darwin.gnused;
    packages.x86_64-darwin.podman = nixpkgs.legacyPackages.x86_64-darwin.podman;
    packages.x86_64-darwin.openjdk8-bootstrap = nixpkgs.legacyPackages.x86_64-darwin.openjdk8-bootstrap;
    packages.x86_64-darwin.kubectl = nixpkgs.legacyPackages.x86_64-darwin.kubectl;
    packages.x86_64-darwin.skaffold = nixpkgs.legacyPackages.x86_64-darwin.skaffold;
    packages.x86_64-darwin.kind = nixpkgs.legacyPackages.x86_64-darwin.kind;
    packages.x86_64-darwin.kubernetes-helm = nixpkgs.legacyPackages.x86_64-darwin.kubernetes-helm;
    packages.x86_64-darwin.default = self.packages.x86_64-darwin.bash;
  };

}
