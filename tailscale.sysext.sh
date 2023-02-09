#!/usr/bin/env bash

set -euo pipefail

dir="$(mktemp -d)"
pushd .
cd "${dir}"

tarball="$(curl 'https://pkgs.tailscale.com/stable/?mode=json' | /home/bjk/.nix-profile/bin/jq -r .Tarballs.amd64)"
version="$(echo ${tarball} | cut -d_ -f2)"

curl "https://pkgs.tailscale.com/stable/${tarball}" -o tailscale.tgz

mkdir -p tailscale/usr/{bin,sbin,lib/{systemd/system,extension-release.d}}
tar xzf tailscale.tgz

cp -vrf "tailscale_${version}_amd64"/tailscale tailscale/usr/bin/tailscale
cp -vrf "tailscale_${version}_amd64"/tailscaled tailscale/usr/sbin/tailscaled
cp -vrf "tailscale_${version}_amd64"/systemd/tailscaled.service tailscale/usr/lib/systemd/system/tailscaled.service

sed -i 's/--port.*//g' tailscale/usr/lib/systemd/system/tailscaled.service

source /etc/os-release
echo -e "SYSEXT_LEVEL=1.0\nID=ubuntu\nVERSION_ID=${VERSION_ID}" >> tailscale/usr/lib/extension-release.d/extension-release.tailscale

mkdir -p /etc/extensions
rm -rf /etc/extensions/tailscale
cp -vrf tailscale /home/bjk/.vanilla/
ln -s /home/bjk/.vanilla/tailscale /etc/extensions/tailscale

mkdir -p /etc/default
touch /etc/default/tailscaled

popd
rm -rf "${dir}"

systemd-sysext merge
