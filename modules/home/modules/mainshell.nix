{ inputs, ...}:
{
	imports = [
		inputs.home-manager.flakeModules.home-manager
	];

	flake.homeModules.mainshell = { pkgs, ...}: {
		programs.alacritty = {
				enable = true;
		};

		programs.nushell= {
				enable = true;
		};
	};
}
