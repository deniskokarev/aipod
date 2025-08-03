# AI-related images

Various Runpod VM images, deployment scripts and instructions.

- Install docker as per https://docs.docker.com/engine/install/ubuntu/
- Signup to docker and Generate Token and login as per https://docs.docker.com/security/access-tokens/
- Optionally place docker images [cache on another drive](https://www.google.com/search?q=docker+mover+images+cache+to+another+directory&sca_esv=d77fcc26cc85d161&sxsrf=AE3TifN8N1wek7K12lj-AinjNHj6jlFW2g%3A1754168128047&ei=QHuOaMbUAo6KptQPndybyAU&oq=docker+mover+images+cache+to+&gs_lp=Egxnd3Mtd2l6LXNlcnAiHWRvY2tlciBtb3ZlciBpbWFnZXMgY2FjaGUgdG8gKgIIATIHECEYoAEYCjIHECEYoAEYCjIHECEYoAEYCjIHECEYoAEYCjIHECEYoAEYCjIFECEYqwIyBRAhGKsCMgUQIRirAkjKWVDTCliDSHABeAGQAQCYAYMBoAHKEaoBBDIxLjW4AQPIAQD4AQGYAhugAqUSwgIKEAAYsAMY1gQYR8ICBBAjGCfCAgoQIxiABBgnGIoFwgILEAAYgAQYkQIYigXCAgoQABiABBhDGIoFwgINEAAYgAQYsQMYQxiKBcICCBAAGIAEGLEDwgINEAAYgAQYsQMYFBiHAsICFBAuGIAEGLEDGIMBGMcBGI4FGK8BwgIOEAAYgAQYkQIYsQMYigXCAhEQLhiABBixAxiDARjHARivAcICChAAGIAEGBQYhwLCAgUQABiABMICBhAAGBYYHsICCxAAGIAEGIYDGIoFwgIIEAAYgAQYogTCAgUQABjvBcICBxAAGIAEGA3CAgYQABgNGB7CAggQABgIGA0YHsICChAAGAgYChgNGB7CAgUQIRifBZgDAIgGAZAGCJIHBDIxLjagB8TdAbIHBDIwLja4B58SwgcHMC4xMS4xNsgHSg&sclient=gws-wiz-serp)
- `sudo docker login --username dakoreff`

# Runpod env as docker build
```shell
runpodctl create pod \
  --communityCloud \
  --containerDiskSize 200 \
  --gpuType "NVIDIA GeForce RTX 4090" \
  --gpuCount 1 \
  --imageName "runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04" \
  --ports "22/tcp" \
  --env PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqY91M9ZnwhuJEX1HknPZoBIggO+4krCzdTnvp347oL dkv@aqua" \
  --name dock
```

```shell
apt update
apt install -y sudo git vim
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo docker login --username dakoreff
git clone --depth 1 https://github.com/deniskokarev/aipod.git ~/aipod
```

# Components
- [Comfy](./comfy/README.md)
- [Kohya_ss](./kohya/README.md)
