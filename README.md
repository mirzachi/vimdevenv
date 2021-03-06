# vimdevenv

## Brief description

A Dockerfile recipe that builds a simple base development environment image that can be later tailored for any C/C++/Python project. This Dockerfile is used to automatically establish the same development environment on various machines and VMs that I use on a daily basis.

The image uses the latest [Ubuntu base image](https://hub.docker.com/_/ubuntu/) from the Docker registry. The built image comprises of the following development tools and packages:

* [build-essential](https://packages.ubuntu.com/bionic/build-essential)
* [python-dev](https://packages.ubuntu.com/bionic/python-dev)
* [python3-dev](https://packages.ubuntu.com/bionic/python3-dev)
* [git](https://packages.ubuntu.com/bionic/git)
* [wget](https://packages.ubuntu.com/bionic/wget)
* [cmake 3.14](https://blog.kitware.com/cmake-3-14-0-available-for-download)
* [vim 8](https://packages.ubuntu.com/bionic/vim)
* [doxygen](http://www.doxygen.nl)
* [graphviz](https://www.graphviz.org)

Additionally, vim is extended with the following plugins:

* [Vundle](https://github.com/VundleVim/Vundle.vim)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [UltiSnips](https://github.com/SirVer/ultisnips)

## Requirements

* Installed Docker EE or CE
* Internet connection

## How to build the image

Clone the repository:

```bash
git clone https://github.com/mirzachi/vimdevenv.git
```

Build the image:

```bash
docker build -t vimdevenv:1.0 .
```

## How to run the image

```bash
docker run -it vimdevenv:1.0
```

## How to clean all the previous containers

```bash
docker ps -a | awk 'NR>1 {print $1}' | xargs docker container rm
```






