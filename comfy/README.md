# ComfyUI

Build and upload ComfyUI image "dakoreff/comfy:flux-dev" on top of "runpod/stable-diffusion:comfy-ui-6.0.0".
Upgrade Comfy, add Flux-Dev GGUF model and my LORAs.
It is leveraging FluxDev GGUF Q8 model, which is sufficient to run with 24GB VRAM.

It may take an hour to download, build and upload depending on your Internet connection.

## Build
Build and upload to DockerHub:
```
./build.sh -u
```

## Launch
Once the Docker image is built and uploaded you could run the ComfyUI pod:
```
runpodctl create pod \
  --communityCloud \
  --volumeSize 5 \
  --containerDiskSize 100 \
  --gpuType "NVIDIA GeForce RTX 4090" \
  --gpuCount 1 \
  --imageName "dakoreff/comfy:flux-dev" \
  --ports "22/tcp" \
  --ports "3000/http" \
  --env PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqY91M9ZnwhuJEX1HknPZoBIggO+4krCzdTnvp347oL dkv@aqua" \
  --name comfy
```

5GB persistent container storage is sufficient to keep workplace between container restarts.

Goto https://console.runpod.io/pods and wait until pod starts. Open Logs and monitor when Docker images downloads
and unpacks. It may take ~10min to start the image. Once container started, click Connect and click on port 3000
to open ComfyUI.

Manager / Model Manager is mostly sufficient for customization and adding more models.

Otherwise, you can open web terminal or direct ssh connection and fiddle with the running container directly.
For example use `wget` to download some non-standard LORAs or Models into /ComfyUI/models.

## Example
As an example you can try Lilia's workflow: Open / Upload "comfy_wflow_lk_sel.json"

The expected result:

![Lilia Rutgers](./img/comfy_wflow_lk_example.jpeg)
