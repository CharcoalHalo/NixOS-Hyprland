{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sddm-chili-theme
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
    theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };
}