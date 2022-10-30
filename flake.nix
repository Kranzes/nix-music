{
  description = "Highly reproducible Nix parodies of popular songs";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = inputs:
    let
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux = {
        every-flake-you-make = pkgs.writeTextFile rec {
          name = "every-flake-you-make";
          meta.origin = "https://youtu.be/OMOGaugKpzs";
          text = ''
            Every NAR you take
            And every flake you make
            Every build you break
            Every store you collect
            Eelco's watching you

            <${meta.origin}>
          '';
        };
        nixy-boy = pkgs.writeTextFile rec {
          name = "nixy-boy";
          meta.origin = "https://youtu.be/ZyhrYis509A";
          text = ''
            I'm a nixy boy, in a Docker world
            Life in shell scripts, it's fantastic
            You can pull my code, inspect my derivation
            Imagination, Nix is your creation

            Come on Eelco, Let's go building

            <${meta.origin}>
          '';
        };
      };
    };
}