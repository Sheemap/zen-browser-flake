# Zen Browser

This is a flake for the Zen browser. Now with auto updating! We check for a new version hourly, so should always have the latest availabe.

Just add it to your NixOS `flake.nix` or home-manager:

```nix
inputs = {
  zen-browser.url = "github:Sheemap/zen-browser-flake";
  ...
}
```

Reference the package later
```nix
inputs.zen-browser.packages."${system}".default
```

Build and run!
```bash
zen
```



## Packages
This flake exposes a package for x86_64 and aarch64. The package is simply a wrapper around the AppImage that's published by zen themselves

To build it yourself
```bash
nix build .#default

# Or
nix build .#
```

## Run without installing
Run this command to build the flake and run instantly.
```bash
nix run github:Sheemap/zen-browser-flake
```

## Contributing
This flake is primarily just for my own use, and no guarantees I will maintain it long term, but Ive been using Zen pretty consistently for a while, and will likely keeping this flake relatively up to date.

If you find this out of date, or youd just like to raise some other question, feel free to open a PR or an issue!
