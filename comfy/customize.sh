#!/bin/bash
# to be executed inside comfy docker image to install missing pieces
# over base runpod/stable-diffusion:comfy-ui-6.0.0

set -o errexit

version=${COMFYUI_VERSION:?"COMFYUI_VERSION must be set"}

# upgrade to given Comfy level
cd /ComfyUI
git fetch --depth 1 origin tag "${version}"
git checkout FETCH_HEAD
pip install -r requirements.txt

# install custom nodes
git clone https://github.com/city96/ComfyUI-GGUF /ComfyUI/custom_nodes/ComfyUI-GGUF
pip install -r /ComfyUI/custom_nodes/ComfyUI-GGUF/requirements.txt
