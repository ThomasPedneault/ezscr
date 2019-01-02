#!/bin/bash
# --------------------------------------------------------------
# NAME  : INSTALL.sh
# DESC  : Install script for ezscr
# AUTHOR: Thomas Pedneault
# DATE  : Wed Jan  2 03:17:15 UTC 2019
# --------------------------------------------------------------
echo "This script will install Easy Script Manager (ezscr) for the current
user."
echo "Requirements:"
echo "  - bash"
echo 
echo "This will:"
echo "  1. Create the .ezscr directory in the home directory."
echo "  2. Copy all the files to the .ezcsr directory."
echo "  3. Modify ~/.bashrc to add ~/.ezscr to PATH."

# Get approval from user to install
read -p "Do you wish to continue with these changes? [Y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]*$ ]]; then
  echo "Will not proceed with these changes. Aborting..."
  exit 0
fi
echo

# Make changes
echo "Creating ~/.ezscr"
mkdir "$HOME/.ezscr"

echo "Copying ezscr files to ~/.ezscr"
current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cp -r $current_dir/* $HOME/.ezscr
rm $HOME/.ezscr/INSTALL.sh

echo "Adding ~/.ezscr and ~/.ezscr/bin to PATH."
echo "export PATH=$HOME/.ezscr:$HOME/.ezscr/bin:\$PATH" >> "$HOME/.bashrc"
source "$HOME/.bashrc"

echo "Complete! You may now delete the installation files."
