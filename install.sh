#!/bin/bash

# This script creates a symbolic link for the 70-logi-k380.rules udev rule.
# It must be run with sudo or as root.

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Configuration ---
# The name of your udev rules file
RULES_FILE="70-logi-k380.rules"
# The destination directory for udev rules
DEST_DIR="/etc/udev/rules.d"

# --- Script Body ---

# 1. Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

# 2. Get the absolute path of the directory where the script is located
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SOURCE_FILE="$SCRIPT_DIR/$RULES_FILE"

# 3. Check if the source rules file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Rules file not found at $SOURCE_FILE"
    echo "Please make sure '$RULES_FILE' is in the same directory as this script."
    exit 1
fi

# 4. Create the symbolic link
echo "Creating symbolic link..."
ln -sf "$SOURCE_FILE" "$DEST_DIR/$RULES_FILE"
echo "Link created: $DEST_DIR/$RULES_FILE -> $SOURCE_FILE"

# 5. Reload udev rules to apply the changes
echo "Reloading udev rules..."
udevadm control --reload-rules
udevadm trigger
echo "Done. The new udev rule should now be active."

exit 0
