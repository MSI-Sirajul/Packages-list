#!/data/data/com.termux/files/usr/bin/bash
# Auto Installer for Termux Package Lister
# Author: MD Sirajul Islam (MSI-Sirajul)

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RESET='\033[0m'

echo -e "${CYAN}🔹 Installing Termux Package Lister...${RESET}"
sleep 1

# Download binary file from GitHub
curl -L -o /data/data/com.termux/files/usr/bin/packages_list \
https://raw.githubusercontent.com/MSI-Sirajul/Packages-list/main/packages_list

# Give execute permission
chmod +x /data/data/com.termux/files/usr/bin/packages_list

echo ""
echo -e "${GREEN}Installation complete!${RESET}"
echo ""
echo -e "${CYAN}Just type: ${GREEN}packages_list${CYAN} to run.${RESET}"
echo ""
