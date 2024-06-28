#!/bin/bash
# Install script for BruteX
#
# VARS
COLOR1='\033[91m'
COLOR2='\033[92m'
COLOR3='\033[92m'
OKBLUE='\033[94m'
RESET='\e[0m'

echo -e "$COLOR1 ___.                 __          $RESET"
echo -e "$COLOR1 \_ |_________ __ ___/  |_  ____  $RESET"
echo -e "$COLOR1  | __ \_  __ \  |  \   __\/ __ \ $RESET"
echo -e "$COLOR1  | \_\ \  | \/  |  /|  | \  ___/ $RESET"
echo -e "$COLOR1  |___  /__|  |____/ |__|  \___  >$RESET"
echo -e "$COLOR1      \/                       \/ $RESET"
echo ""
echo -e "$COLOR1 + -- --=[ brute v$VER by @dandelion$RESET"
echo -e "$COLOR1 + -- --=[ Made in Ukraine :)$RESET"
echo -e "$RESET"

BRUTEX_INSTALL_DIR=/usr/share/brute

echo -e "$OKBLUE[*]$RESET Installing brute under $BRUTEX_INSTALL_DIR..."
mkdir -p $BRUTEX_INSTALL_DIR 2> /dev/null
cp -Rf $PWD/* $BRUTEX_INSTALL_DIR 
cd $BRUTEX_INSTALL_DIR
apt-get update
apt-get install -y nmap hydra dnsenum
mkdir loot 2> /dev/null
chmod +x $BRUTEX_INSTALL_DIR/brutex
rm -f /usr/bin/brute 2> /dev/null
ln -s /usr/share/brute/brute /usr/bin/brute
cp -f $BRUTEX_INSTALL_DIR/brute.desktop /usr/share/applications/ 2> /dev/null
cp -f $BRUTEX_INSTALL_DIR/brute.desktop /usr/share/applications/brute.desktop 2> /dev/null
cp -f $BRUTEX_INSTALL_DIR/brute.desktop /usr/share/kali-menu/applications/brute.desktop 2> /dev/null
echo -e "$OKBLUE[*]$RESET Done! $RESET"