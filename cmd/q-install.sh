#!/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Variable to track if SSL certificate has been installed
ssl_installed=false

# Function to display the banner
display_banner() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                                                                              ║"
    echo "║                    ${WHITE}H${CYAN}-${WHITE}U${CYAN}-${WHITE}I${CYAN} ${WHITE}INSTALL${CYAN} ${WHITE}MENU${CYAN}                    ║"
    echo "║                                                                              ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Function to display the menu
display_menu() {
    echo -e "${YELLOW}Please select an option:${NC}"
    echo -e "${GREEN}1. Install SSL Certificate${NC}"
    echo -e "${GREEN}2. Install H-UI Script${NC}"
    echo -e "${RED}3. Exit${NC}"
    echo -n -e "${WHITE}Enter your choice [1-3]: ${NC}"
}

# Main script loop
while true; do
    clear
    display_banner
    display_menu
    read choice
    
    case $choice in
        1)
            echo -e "${YELLOW}Installing SSL Certificate...${NC}"
            bash <(curl -Ls https://raw.githubusercontent.com/MasterHide/h-ui/main/ssl.sh --ipv4)
            ssl_installed=true
            echo -e "${GREEN}SSL Certificate installation completed.${NC}"
            echo -e "${WHITE}Press Enter to continue...${NC}"
            read
            ;;
        2)
            if [ "$ssl_installed" = false ]; then
                echo -e "${RED}Please install SSL certificate first!${NC}"
                echo -e "${WHITE}Press Enter to continue...${NC}"
                read
            else
                echo -e "${YELLOW}Installing H-UI Script...${NC}"
                bash <(curl -fsSL https://raw.githubusercontent.com/MasterHide/h-ui/main/install.sh)
                echo -e "${GREEN}H-UI Script installation completed.${NC}"
                echo -e "${WHITE}Press Enter to continue...${NC}"
                read
            fi
            ;;
        3)
            echo -e "${CYAN}Exiting the script. Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option! Please choose between 1 and 3.${NC}"
            echo -e "${WHITE}Press Enter to continue...${NC}"
            read
            ;;
    esac
done
