#!/bin/bash

echo "Installing Clojure"
nix-env -i clojure
nix-env -i leiningen
