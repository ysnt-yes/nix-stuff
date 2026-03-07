{ inputs, self, ... }: {
  flake.nixosModules.yes-user = { pkgs, ... }: {

    users.users.yes = {
		isNormalUser = true;
		description = "yes";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [
			kdePackages.kate
		];
		shell = pkgs.zsh;
	};

	programs.zsh.enable = true;

};

}
