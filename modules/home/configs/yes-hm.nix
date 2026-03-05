{ inputs, self, ...}:
{
	imports = [
		inputs.home-manager.flakeModules.home-manager
	];

	flake.homeConfigurations.yes = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs;
          modules = [
            self.homeModules.mainshell
            {
              home.username = "yes";
              home.homeDirectory = "/home/yes";
              home.stateVersion = "25.11";
            }
          ];
        };
}
