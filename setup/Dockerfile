FROM ubuntu:latest
WORKDIR ~
RUN apt-get update --fix-missing 
RUN apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion
COPY install.sh ./
RUN bash install.sh