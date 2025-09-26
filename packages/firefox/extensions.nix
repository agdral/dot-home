{
  firefox-addons,
  pkgs,
  ...
}:
with firefox-addons.packages.${pkgs.system}; [
  ublock-origin
  darkreader
  tridactyl
  proton-pass
  proton-vpn
  sponsorblock
  don-t-fuck-with-paste
  bonjourr-startpage
]
