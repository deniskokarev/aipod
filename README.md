# AI-related images

Various VM images, deployment scripts and instructions.

- Install docker as per https://docs.docker.com/engine/install/ubuntu/
- Signup to docker and Generate Token and login as per https://docs.docker.com/security/access-tokens/
- Optionally place docker images cache on another drive as per 
  https://www.google.com/search?q=docker+mover+images+cache+to+another+directory&sca_esv=d77fcc26cc85d161&sxsrf=AE3TifN8N1wek7K12lj-AinjNHj6jlFW2g%3A1754168128047&ei=QHuOaMbUAo6KptQPndybyAU&oq=docker+mover+images+cache+to+&gs_lp=Egxnd3Mtd2l6LXNlcnAiHWRvY2tlciBtb3ZlciBpbWFnZXMgY2FjaGUgdG8gKgIIATIHECEYoAEYCjIHECEYoAEYCjIHECEYoAEYCjIHECEYoAEYCjIHECEYoAEYCjIFECEYqwIyBRAhGKsCMgUQIRirAkjKWVDTCliDSHABeAGQAQCYAYMBoAHKEaoBBDIxLjW4AQPIAQD4AQGYAhugAqUSwgIKEAAYsAMY1gQYR8ICBBAjGCfCAgoQIxiABBgnGIoFwgILEAAYgAQYkQIYigXCAgoQABiABBhDGIoFwgINEAAYgAQYsQMYQxiKBcICCBAAGIAEGLEDwgINEAAYgAQYsQMYFBiHAsICFBAuGIAEGLEDGIMBGMcBGI4FGK8BwgIOEAAYgAQYkQIYsQMYigXCAhEQLhiABBixAxiDARjHARivAcICChAAGIAEGBQYhwLCAgUQABiABMICBhAAGBYYHsICCxAAGIAEGIYDGIoFwgIIEAAYgAQYogTCAgUQABjvBcICBxAAGIAEGA3CAgYQABgNGB7CAggQABgIGA0YHsICChAAGAgYChgNGB7CAgUQIRifBZgDAIgGAZAGCJIHBDIxLjagB8TdAbIHBDIwLja4B58SwgcHMC4xMS4xNsgHSg&sclient=gws-wiz-serp
- `sudo docker login --username dakoreff`

# ComfyUI

Build and upload ComfyUI image "dakoreff/comfy:flux-dev", which may take about an hour to upload.
It is leveraging FluxDev GGUF Q8 model, which is sufficient to run with 24GB VRAM.

```
./build_comfy.sh -u
```

Once the Docker image is built and uploaded you could run the pod:
```
runpodctl create pod \
  --communityCloud \
  --containerDiskSize 100 \
  --gpuType "NVIDIA GeForce RTX 4090" \
  --gpuCount 1 \
  --imageName "dakoreff/comfy:flux-dev" \
  --ports "22/tcp" \
  --ports "3000/http" \
  --env PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqY91M9ZnwhuJEX1HknPZoBIggO+4krCzdTnvp347oL dkv@aqua" \
  --name comfy
```

Goto https://console.runpod.io/pods and wait until pod starts. Open Logs and monitor when Docker images downloads
and unpacks. It may take ~10min. Once container started, click Connect and click on port 3000 to open ComfyUI.

You can also open direct ssh connection and fiddle with the running container directly.
For example use `wget` to download some non-standard LORAs or Models into /ComfyUI/models.

However, Manager / Model Manager is mostly sufficient.

As an example you can try Lilia's workflow: Open / Upload "comfy_wflow_lk_sel.json"

The expected result:
![Lilia Rutgers](./img/comfy_wflow_lk_example.jpeg)
