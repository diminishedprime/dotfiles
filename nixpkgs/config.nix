{
  packageOverrides = pkgs: rec {
    polybar = pkgs.polybar.override { i3Support = true; };
  };
}
