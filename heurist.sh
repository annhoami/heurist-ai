#!/bin/bash

sudo apt update & sudo apt upgrade -y
sudo apt install python3-venv curl git -y

sleep 1

curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh && bash anaconda.sh && conda init bash && source ~/.bashrc && conda create --name gpu-3-11 python=3.11 -y && conda activate gpu-3-11

sleep 1

cd $HOME
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
git clone https://github.com/heurist-network/miner-release
cd miner-release
pip install -r requirements.txt

sleep 1

read -p "Enter WALLET_ADDRESS: " WALLET_ADDRESS
echo

sleep 1

cat <<EOF > .env
MINER_ID_0=$WALLET_ADDRESS
EOF

sleep 1

cd $HOME/miner-release && python3 ./auth/generator.py

python sd-miner-v1.3.1.py --exclude-sdxl

sleep 1
