# vdots
VanillaOS nix home-manager configs

## Usage
* git clone to some directory
* `./apply.sh`
* profit

## Kargs:
`rw quiet splash bgrt_disable loglevel=3 SYSTEMD_UNIT_PATH=/nix/var/nix/profiles/per-user/bjk/profile/lib/systemd/system:`

add the `SYSTEMD_UNIT_PATH` (don't forget the : at the end) to your kargs and all the unit files from nix things will appear in your systemd instances.

