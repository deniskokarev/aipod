#!/bin/bash
# a slightly customized ComfyUI built on top of standard runpod comfy image
set -o errexit

COMFYUI_VERSION="v0.3.48"

do_help() {
  echo "Build Comfy Docker image"
  echo "Usage: $0 [-u]"
  echo "-u - upload to DockerHub"
}

# Parse options using getopts
while getopts "hu" opt; do
  case "${opt}" in
    u)
      do_upload=1
      ;;
    *)
      do_help
      exit 1
      ;;
  esac
done

# Shift processed options and their arguments
shift $((OPTIND - 1))

# Download models locally into cache dir
script_dir="${0%%/*}"
cache_dir="${script_dir}/cache"
mkdir -p "${cache_dir}"

# FluxDev GGUF model and CLIP
wget --continue -O "${cache_dir}"/flux1-dev-Q8_0.gguf https://huggingface.co/city96/FLUX.1-dev-gguf/resolve/main/flux1-dev-Q8_0.gguf
wget --continue -O "${cache_dir}"/flux-ae.safetensors https://huggingface.co/ffxvs/vae-flux/resolve/main/ae.safetensors
wget --continue -O "${cache_dir}"/t5xxl_fp8_e4m3fn.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors
wget --continue -O "${cache_dir}"/clip_l.safetensors https://huggingface.co/Comfy-Org/stable-diffusion-3.5-fp8/resolve/main/text_encoders/clip_l.safetensors

# Useful LORAs from dakoreff Google Drive
while read NM GDID; do
	  wget --continue -O "${cache_dir}"/"${NM}.safetensors" "https://drive.usercontent.google.com/download?id=${GDID}&export=download&authuser=1&confirm=t"
done <<EOF
li 1Ly9Yuvz4IIGLp9R1WGVCA3xvEcohdOb-
hands2 15nf0Waeec7PritsbNuVI3nnMdJ2Nvg5i
nsfw 1tAAJ27rsmsefMBGFqxrllNWooAJAPY8u
EOF

# build the image with downloaded models
sudo docker build --build-arg COMFYUI_VERSION="${COMFYUI_VERSION}" -t dakoreff/comfy:flux-dev -f Dockerfile .
if [ "$do_upload" != "" ]; then
  sudo docker push dakoreff/comfy:flux-dev
fi
