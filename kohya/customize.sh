#!/bin/bash
# to be executed inside pytorch docker image to install kohya

set -o errexit

kohya_ss_ver=${KOHYA_SS_VER:?"KOHYA_SS_VER must be set"}
sd_scripts_ver=${SD_SCRIPTS_VER:?"SD_SCRIPTS_VER must be set"}

apt-get update
apt install -y git sudo vim tmux python3-tk

git clone --branch "${kohya_ss_ver}" --depth 1 https://github.com/bmaltais/kohya_ss.git /kohya_ss
git clone --branch "${sd_scripts_ver}" --depth 1 https://github.com/kohya-ss/sd-scripts.git /kohya_ss/sd-scripts

python3 -m venv /kohya_ss/venv
source /kohya_ss/venv/bin/activate
bash -x /kohya_ss/setup.sh --no-git-update --no-gui --dir /kohya_ss
