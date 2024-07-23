#!/bin/bash

BOLD="\033[1m"
UNDERLINE="\033[4m"
DARK_YELLOW="\033[0;33m"
CYAN="\033[0;36m"
RESET="\033[0;32m"

execute_with_prompt() {
    echo -e "${BOLD}Executing: $1${RESET}"
    if eval "$1"; then
        echo "Command executed successfully."
    else
        echo -e "${BOLD}${DARK_YELLOW}Error executing command: $1${RESET}"
        exit 1
    fi
}

echo -e "${BOLD}${DARK_YELLOW}Installing packages...${RESET}"
sudo apt update & sudo apt upgrade -y
sudo apt install python3-venv curl git -y
echo

echo -e "${BOLD}${DARK_YELLOW}Installing pytorch and other libs...${RESET}"
cd $HOME
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
git clone https://github.com/heurist-network/miner-release
cd miner-release
pip install -r requirements.txt
echo

read -p "Enter WALLET_ADDRESS: " WALLET_ADDRESS
echo

echo -e "${BOLD}${DARK_YELLOW}Creating .env file...${RESET}"
cat <<EOF > .env
MINER_ID_0=$WALLET_ADDRESS
EOF

echo -e "${BOLD}${DARK_YELLOW}.env file generated...${RESET}"
echo

echo -e "${BOLD}${DARK_YELLOW}Generating Identify Wallet...${RESET}"
cd $HOME/miner-release && python3 ./auth/generator.py

echo -e "${BOLD}${DARK_YELLOW}Running SD model...${RESET}"
python sd-miner-v1.3.1.py --exclude-sdxl
echo

