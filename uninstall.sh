#!/bin/bash

# This script removes the symbolic link for the 70-logi-k380.rules udev rule.
# It must be run with sudo or as root.

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Configuration ---
# The name of your udev rules file
RULES_FILE="70-logi-k380.rules"
# The destination path for the symbolic link
LINK_PATH="/etc/udev/rules.d/$RULES_FILE"

# --- Script Body ---

# 1. Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

# 2. Check if the symbolic link exists before trying to remove it
if [ ! -L "$LINK_PATH" ]; then
    echo "Symbolic link not found at $LINK_PATH. Nothing to do."
    exit 0
fi

# 3. Remove the symbolic link
echo "Removing symbolic link: $LINK_PATH"
rm -f "$LINK_PATH"
echo "Link removed."

# 4. Reload udev rules to apply the changes
echo "Reloading udev rules..."
udevadm control --reload-rules
udevadm trigger
echo "Done. The udev rule has been deactivated."

exit 0
