FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gcc-avr binutils-avr avr-libc wget unzip && rm -rf /var/lib/apt/lists/* 

