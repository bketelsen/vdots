#!/bin/bash

export NIXPKGS_ALLOW_UNFREE=1 
nix run . --impure switch -- --flake .
