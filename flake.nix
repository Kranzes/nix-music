{
  description = "Highly reproducible Nix parodies of popular songs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = inputs:
    let
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux = {
        every-flake-you-make = pkgs.writeTextFile {
          name = "every-flake-you-make";
          meta.origin = "https://youtu.be/OMOGaugKpzs";
          text = ''
            Every NAR you take
            And every flake you make
            Every build you break
            Every store you collect
            Eelco's watching you
          '';
        };
        nixy-boy = pkgs.writeTextFile {
          name = "nixy-boy";
          meta.origin = "https://youtu.be/ZyhrYis509A";
          text = ''
            I'm a nixy boy, in a Docker world
            Life in shell scripts, it's fantastic
            You can pull my code, inspect my derivation
            Imagination, Nix is your creation

            Come on Eelco, Let's go building
          '';
        };
      };
      apps.x86_64-linux = builtins.mapAttrs
        (song: lyrics: {
          type = "app";
          program = toString (pkgs.writeScript "listen-${song}" ''
            ${pkgs.lib.getExe pkgs.espeak-ng} -f ${lyrics} &
            ${pkgs.coreutils}/bin/cat ${lyrics}
          ''
          );
        })
        inputs.self.packages.x86_64-linux;
    };
}
