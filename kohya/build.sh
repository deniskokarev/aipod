#!/bin/bash
# Kohya built on top of standard runpod pytorch 2.4 image
set -o errexit

KOHYA_SS_VER="v25.2.1"
SD_SCRIPTS_VER="v0.9.1"

do_help() {
  echo "Build Kohya Docker image"
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

# build the image with downloaded models
sudo docker build --build-arg KOHYA_SS_VER="${KOHYA_SS_VER}" --build-arg SD_SCRIPTS_VER="${SD_SCRIPTS_VER}" -t dakoreff/kohya:25 -f Dockerfile .
if [ "$do_upload" != "" ]; then
  sudo docker push dakoreff/kohya:25
fi
