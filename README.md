# heurist-ai

## Start Akash

```bash
apt update && apt install tmux sudo wget curl -y && tmux
```

## Install anaconda

```bash
curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh && bash anaconda.sh && conda init bash && source ~/.bashrc && conda create --name gpu-3-11 python=3.11 -y && conda activate gpu-3-11
```

## Run node

```bash
wget https://raw.githubusercontent.com/annhoami/heurist-ai/main/heurist.sh && chmod +x heurist.sh && ./heurist.sh
```

```bash
curl --output anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh && bash anaconda.sh && conda init bash && source ~/.bashrc && conda create --name gpu-3-11 python=3.11 -y && conda activate gpu-3-11
```
