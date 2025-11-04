#!/data/data/com.termux/files/usr/bin/bash

# ────────────────────────────────────────────────
#   Termux APT Package Lister
#   Author: MD Sirajul Islam
# ────────────────────────────────────────────────

# 🟩 Color Variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# 🧩 File Names
ALL_LIST="all_packages.txt"
INSTALLED_LIST="installed_packages.txt"
AVAILABLE_LIST="available_packages.txt"

# 🎨 Banner Function
banner() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "╔══════════════════════════════════════╗"
    echo "║        Termux Package Lister         ║"
    echo "║      Developed by: MSI-Sirajul       ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${RESET}"
}

# 🔁 Main Function
main_menu() {
    banner
    echo -e "${YELLOW}Choose an option:${RESET}"
    echo "1: List ALL packages"
    echo "2: List INSTALLED packages"
    echo "3: List AVAILABLE packages"
    echo "4: Exit"
    echo -n -e "${CYAN}Enter your choice (1-4): ${RESET}"
    read choice

    case $choice in
      1)
        echo -e "${CYAN}Generating all packages list...${RESET}"
        {
          echo "=== Installed Packages ==="
          apt list 2>/dev/null | grep "\[installed\]" | cut -d/ -f1 | sort -u
          echo ""
          echo "=== Available Packages ==="
          apt list 2>/dev/null | grep -v "\[installed\]" | cut -d/ -f1 | sort -u
        } > "$ALL_LIST"
        echo -e "${GREEN}All PKG list saved to $ALL_LIST${RESET}"
        total=$(grep -vc "^$" "$ALL_LIST")
        echo -e "${YELLOW}Total packages: $total${RESET}"
        ;;
      2)
        echo -e "${CYAN}Generating installed packages list...${RESET}"
        apt list 2>/dev/null | grep "\[installed\]" | cut -d/ -f1 | sort -u > "$INSTALLED_LIST"
        echo -e "${GREEN}Installed PKG list saved to $INSTALLED_LIST${RESET}"
        total=$(grep -vc "^$" "$INSTALLED_LIST")
        echo -e "${YELLOW}Total installed: $total${RESET}"
        ;;
      3)
        echo -e "${CYAN}Generating available packages list...${RESET}"
        apt list 2>/dev/null | grep -v "\[installed\]" | cut -d/ -f1 | sort -u > "$AVAILABLE_LIST"
        echo -e "${GREEN}Available PKG list saved to $AVAILABLE_LIST${RESET}"
        total=$(grep -vc "^$" "$AVAILABLE_LIST")
        echo -e "${YELLOW}Total available: $total${RESET}"
        ;;
      4)
        echo -e "${RED}Exiting...${RESET}"
        exit 0
        ;;
      *)
        echo -e "${RED}Invalid choice! Please try again.${RESET}"
        sleep 1
        main_menu
        ;;
    esac

    # 🔄 Confirmation Before Exit
    echo ""
    echo -n -e "${CYAN}Do you want to exit? (y/n): ${RESET}"
    read confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        echo -e "${GREEN}Exiting... Have a great day!${RESET}"
        exit 0
    else
        main_menu
    fi
}

# 🚀 Run the Script
main_menu
