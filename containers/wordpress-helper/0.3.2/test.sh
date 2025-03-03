#!/bin/sh

# Check if required commands are available
require_cmds() {
  for cmd in "$@"; do
    echo "Checking for command: $cmd"
    if ! command -v "$cmd" >/dev/null 2>&1; then
      echo "Required command '$cmd' not found. Fail!"
      exit 1
    else
      echo "$cmd found. Pass."
    fi
  done
}

require_cmds curl unzip git yq jq htmlq skopeo aws devspace zstd mydumper myloader

# Require the ^host exists in the mydumper.cnf file
if ! grep -q "^host " /etc/mydumper.cnf; then
  echo "Required 'host' not found in /etc/mydumper.cnf. Fail!"
  exit 1
else
  echo "host found in /etc/mydumper.cnf. Pass."
fi