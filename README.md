#### Conventions
##### Files For Your Docker Image
Store files used by the `ADD` or `COPY` directives in your `Dockerfile` in `./files`.  This directory should be treated as the top-level overlay for the Docker image's filesystem (so if you want a file called `foo.conf` in `/etc` in your Docker image, create it in `./files/etc/foo.conf` and then `COPY files/etc/foo.conf /etc/foo.conf` in your `Dockerfile`).

#### Setup
```
docker-machine start default &
sudo gem install bundler
bundle
```

#### Automated Tests
```
bundle exec rspec spec/*
```

#### Build
DANGER! DANGER! DANGER!

*Before* you build, check the [smartB Docker registry](https://hub.docker.com/u/smartb/dashboard) to see what the latest tag for this image is. If you assign an already-existing tag to your new Docker image and then do a `docker push` you *will* overwrite the version in the Docker registry.  This action is destructive and can't be undone.
```
docker build -t smartb/<image name>:<tag> .
```

#### Interactive Testing
```
docker run -it smartb/<image name>:<tag> /bin/bash
cat /some/file
ls /some/directory
```

#### Push
```
docker login
docker push smartb/<image name>:<tag>
```

#### Deploy
If you don't already have access to the Triton Docker hosting service, ask an administrator for access. Set up your Triton access by `export`ing the variables below or by adding the lines below to `~/.bash_profile`:
```
export DOCKER_CERT_PATH=$HOME/.sdc/docker/smartb
export DOCKER_HOST=tcp://eu-ams-1.docker.joyent.com:2376
export DOCKER_CLIENT_TIMEOUT=300
export DOCKER_TLS_VERIFY=1
```
Now download and run the Triton setup script for Docker:
```
curl -O https://raw.githubusercontent.com/joyent/sdc-docker/master/tools/sdc-docker-setup.sh

bash sdc-docker-setup.sh https://eu-ams-1.api.joyent.com smartb $HOME/.ssh/id_rsa
```
Deploy your container using the appropriate image from the Docker Hub's smartB repo:
```
docker login
docker run --memory=128m --restart="always" -t smartb/<image name>:<tag>
```
