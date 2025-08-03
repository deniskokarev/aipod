# Kohya

kohya_ss runpod image

Build/upload docker image
```
./build.sh -u
```

Launch
```shell
runpodctl create pod \
  --communityCloud \
  --containerDiskSize 100 \
  --gpuType "NVIDIA GeForce RTX 4090" \
  --gpuCount 1 \
  --imageName "runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04" \
  --ports "22/tcp" \
  --ports "7860/http" \
  --env PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqY91M9ZnwhuJEX1HknPZoBIggO+4krCzdTnvp347oL dkv@aqua" \
  --name kohya
```
