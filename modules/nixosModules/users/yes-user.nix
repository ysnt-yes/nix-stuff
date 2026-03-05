{ inputs, self, ... }: {
  flake.nixosModules.yes-user = { pkgs, ... }: {
	modules = [
		self.homeConfigurations.yes
	];

    users.users.yes = {
		isNormalUser = true;
		description = "yes";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
			kdePackages.kate
		];
	};


  };
}
