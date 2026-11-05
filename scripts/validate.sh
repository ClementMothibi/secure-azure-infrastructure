#!/usr/bin/env bash
set -euo pipefail

# Local checks only. This script does not deploy Azure resources.
command -v az >/dev/null 2>&1 || { echo "Azure CLI (az) is not installed."; exit 1; }
command -v git >/dev/null 2>&1 || echo "Note: Git is not installed."

if ! az bicep version >/dev/null 2>&1; then
  echo "Bicep CLI is unavailable. Install it with: az bicep install"
  exit 1
fi

echo "Compiling Bicep template..."
az bicep build --file infrastructure/main.bicep

echo "Bicep compilation completed."
echo "This validates compilation only; it does not prove Azure deployment will succeed."
