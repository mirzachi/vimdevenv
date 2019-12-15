# Use Ubuntu:latest image as a base image
FROM ubuntu:18.04

# Add some metadata for inspection purposes
LABEL version="1.0" \
      maintainer="mirzachi@gmail.com" \
      description="A small simple C/C++/Python development environment based on VIM."

# Install necessary dependencies and remove the apt cache since we do not need it later on
RUN apt-get update && \
    apt-get -y install build-essential vim git python-dev python3-dev wget clang-format doxygen graphviz && \
    rm -rf /var/lib/apt/lists/*

# Set a working directory
WORKDIR /root

# Download, compile and install cmake 3.14 (for modern cmake scripts)
ENV cmake_version "3.14.4"
RUN wget https://github.com/Kitware/CMake/releases/download/v${cmake_version}/cmake-${cmake_version}.tar.gz
RUN tar -xzf cmake-${cmake_version}.tar.gz
RUN cd cmake-${cmake_version} && \
    ./bootstrap && make install && \
    rm -r cmake-*

# Install Vundle - vim plugin manager
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy my .vimrc file to the image
COPY vimrc ./.vimrc

# Copy an example C++ project built with CMake to the image
COPY Example_Modern_CMake ./Example_Modern_CMake

# Install vim plugins 
RUN vim -c 'PluginInstall' -c 'qa!'

# There is a cmake issue with clang downloading in the next command, therefore a manual download is necessary
RUN mkdir -p ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives && \
    cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives && \
    wget https://dl.bintray.com/micbou/libclang/libclang-9.0.0-x86_64-unknown-linux-gnu.tar.bz2 

# Compile and install YouCompleteMe 
RUN cd ~/.vim/bundle/YouCompleteMe && python3 install.py --clang-completer

# When starting a container (running an image) execute this command
ENTRYPOINT ["/bin/bash"]


