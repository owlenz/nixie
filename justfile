host := `hostname -s`

# lists all recipes
help:
    just --list

# regenerates flake.nix (flake-file)
flakes:
    nix run .#write-flake

# checks if it builds (no errors)
build *args:
    sudo nixos-rebuild build --flake .#{{host}} {{args}}

# activate the last build without rebuilding
activate *args:
    sudo ./result/bin/switch-to-configuration switch
    rm -f result

# builds and switches to the new configuration
switch *args:
  nh os switch {{args}} .#{{host}}

# only shows changes
dry *args:
    sudo nixos-rebuild dry-activate --flake .#{{host}} {{args}}
