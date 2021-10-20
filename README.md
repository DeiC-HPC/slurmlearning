# Slurmlearning

A webbased tool for learning slurm based on
[Corelearning](https://github.com/DeiC-HPC/corelearning).

## Deployment

### Prerequisites

Before we get started you should have the following programs installed:

- Python3 (>=3.5 with pip)
- Nodejs
- Typescript
- docker


### Requirements to your docker
This project uses the Docker API for communicating with the docker container
over a websocket. So you will need to set your docker up to use a tcp listener.
[More information can be found here.](https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-socket-option)

We recommend that the socket only listens to requests coming from localhost.
If that is what you wish add `-H tcp://127.0.0.1:2375` to the startup of your
docker server. If you want to use a different port or address then please do
so, but remember to change `docker-url` in [config.yaml](config.yaml).

### Building the docker image

To build the docker image run `docker build . -t slurm-debian`. This will
create a docker image with the same tag as specified in
[config.yaml](config.yaml).

### Installing and compiling needed libraries

Inside `corelearning/server` you should run the command
`pip3 install -r requirements.txt` and in `corelearning/html` you should run
`npm install`. After running `npm install` in `corelearning/html` you should run
`webpack` to compile the typescript.

### Running the python server

From the root directory of this repository run the command
`python3 corelearning/server/main.py`.

### Hosting the html

The html can be hosted with any webserver.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on the process for
submitting pull requests, bugs, and feature requests to us.

## License

This project is licensed under the EUPL License - see the [LICENSE](LICENSE)
file for details.
