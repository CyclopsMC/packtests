#!/bin/bash
# Prints the latest mod loader build for a Minecraft version, using the same
# sources HeadlessMC resolves "latest" from. Used to key the ~/.minecraft cache,
# so a new loader release invalidates it automatically.
#
# Usage: resolve-loader-version.sh <neoforge|forge|fabric> <mc-version>
set -euo pipefail

loader="$1"
mc="$2"

fetch() {
  curl --silent --show-error --fail --location --retry 3 --retry-delay 5 "$1"
}

case "$loader" in
  neoforge|forge)
    uid=$([ "$loader" = "neoforge" ] && echo net.neoforged || echo net.minecraftforge)
    version=$(fetch "https://meta.prismlauncher.org/v1/$uid/index.json" \
      | jq -r --arg mc "$mc" '.versions[] | select(any(.requires[]?; .uid == "net.minecraft" and .equals == $mc)) | .version' \
      | sort -V | tail -n 1)
    ;;
  fabric)
    # Fabric loader is Minecraft-version independent.
    version=$(fetch "https://meta.fabricmc.net/v2/versions/loader" | jq -r 'max_by(.build).version')
    ;;
  *)
    echo "Unknown loader: $loader" >&2
    exit 1
    ;;
esac

if [ -z "$version" ] || [ "$version" = "null" ]; then
  echo "Could not resolve latest $loader version for Minecraft $mc" >&2
  exit 1
fi

echo "$version"
