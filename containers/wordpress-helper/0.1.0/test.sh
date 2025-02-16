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

require_cmds curl unzip git yq jq htmlq skopeo aws devspace