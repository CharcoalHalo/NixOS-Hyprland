---
description: how to run apps as root in hyprland e.g. gparted
---

# Running apps as root hyprland

run shell with xhost `nix-shell -p xorg.xhost`

allow root to access X session `xhost si:localuser:root`

launch app `sudo -E program`

remove root access `xhost -si:localuser:root`
