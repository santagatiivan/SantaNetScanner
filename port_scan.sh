#!/bin/bash


# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${RED}  _________              __          _______          __   _________                                           "                      
echo -e "${RED} /   _____/____    _____/  |______   \      \   _____/  |_/   _____/ ____ _____    ____   ____   ___________   " 
echo -e "${RED} \_____  \\__  \  /    \   __\__  \  /   |   \_/ __ \   __\_____  \_/ ___\\__  \  /    \ /    \_/ __ \_  __ \  "
echo -e "${RED} /        \/ __ \|   |  \  |  / __ \/    |    \  ___/|  | /        \  \___ / __ \|   |  \   |  \  ___/|  | \/  "
echo -e "${RED}/_______  (____  /___|  /__| (____  |____|__  /\___  >__|/_______  /\___  >____  /___|  /___|  /\___  >__|     " 
echo -e "${RED}        \/     \/     \/          \/        \/     \/            \/     \/     \/     \/     \/     \/         "


#!/bin/bash

# Initial prompt for language selection
echo "Select your language / Seleziona la tua lingua:"
echo "1) English"
echo "2) Italiano"
read -p "Language / Lingua [1/2]: " lang_choice

if [ "$lang_choice" == "2" ]; then
  LANGUAGE="it"
else
  LANGUAGE="en"
fi

# Load language file based on selection
source "lang_$LANGUAGE.sh"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

check_dependency() {
    if ! command -v nmap &> /dev/null; then
        echo -e "${RED}$MSG_NMAP_NOT_FOUND${NC}"
        exit 1
    fi
}

validate_ip() {
    if [[ ! $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo -e "${RED}$MSG_INVALID_IP${NC}"
        echo -e "${RED}$MSG_USE_FORMAT${NC}\n"
        exit 1
    fi
}

perform_scan() {
    IP_INPUT=$1
    OUTPUT_FILE=$2
    OUTPUT_FORMAT=${3:-txt} # Default to txt if no format is specified

    if ! [[ "$OUTPUT_FORMAT" =~ ^(txt|xml|csv|json)$ ]]; then
        echo -e "${RED}$MSG_INVALID_FORMAT${NC}"
        exit 1
    fi

    OPTIONS="-v -sV -T4 -O --version-intensity 9"
    OUTPUT_OPTION="-oN"
    if [ "$OUTPUT_FORMAT" == "xml" ]; then OUTPUT_OPTION="-oX"
    elif [ "$OUTPUT_FORMAT" == "json" ]; then OUTPUT_OPTION="-oJ"
    fi

    echo -e "$MSG_START_SCAN ${GREEN}$IP_INPUT${NC}"
    nmap $OPTIONS -p $PORT_RANGE $IP_INPUT $OUTPUT_OPTION "$OUTPUT_FILE"
    echo -e "${GREEN}$MSG_COMPLETE_SCAN $OUTPUT_FILE${NC}"
}

if [ "$#" -lt 2 ]; then
    echo -e "${RED}$MSG_USAGE${NC}"
    exit 1
fi

check_dependency
validate_ip $1
perform_scan $1 $2 $3


