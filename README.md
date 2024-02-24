# NixOS-Hyprland
My Hyprland setup on NixOS

### Vscodium wayland crash
set window.titleBarStyle=custom 
or try --disable-gpu

### Running GUI apps as root (gparted)
run shell with xhost
``nix-shell -p xorg.xhost``

allow root to access X session
``xhost si:localuser:root``

launch app 
``sudo -E program``

remove root access
``xhost -si:localuser:root``

