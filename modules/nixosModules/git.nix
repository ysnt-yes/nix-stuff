{ inputs, ... }: {
	flake.nixosModules.git = { pkgs, ... }: {
		programs.git = {
			enable = true;
			settings = {
				user = {
					name = "YSNT";
					email = "yes@ysnt.live";
				};
				init.defaultBranch = "main";

				credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
				push = { autoSetupRemote = true; };
			};
		};
	};
}
