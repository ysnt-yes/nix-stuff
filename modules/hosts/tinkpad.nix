{ inputs, self, ... }: {
	flake.nixosConfigurations.tinkpad = inputs.nixpkgs.lib.nixosSystem {
		modules = [
			self.nixosModules.tinkpadModule
			self.nixosModules.defaultSettings
			self.nixosModules.firefox
			self.nixosModules.locale
			self.nixosModules.tinkpadHardwareConfig

			self.nixosModules.yes-user
			inputs.home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.yes = { imports = [
					self.homeModules.mainshell
					{
						home.username = "yes";
						home.homeDirectory = "/home/yes";
						home.stateVersion = "25.11";
					}
				];};
			}


		];
	};

	flake.nixosModules.tinkpadModule = { pkgs, ...}: {
		boot.loader.systemd-boot.enable = true;
		boot.loader.efi.canTouchEfiVariables = true;

		boot.kernelPackages = pkgs.linuxPackages_latest;

		networking.hostName = "yes-laptop-nixos";
		networking.networkmanager.enable = true;

			services.xserver.enable = true;
		services.displayManager.sddm.enable = true;
		services.desktopManager.plasma6.enable = true;

		services.xserver.xkb = {
			layout = "us";
			variant = "";
		};

		services.printing.enable = true;

		services.pulseaudio.enable = false;
		security.rtkit.enable = true;
		services.pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
		};

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		microsoft-edge
		vim
		git
		discord
		#github
		spotify
	];

	powerManagement.enable = true;

	system.stateVersion = "25.11";

	};
}
