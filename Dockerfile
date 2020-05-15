FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gcc-avr binutils-avr avr-libc wget unzip cmake autoconf gcovr lcov libgtest-dev libboost-test-dev doxygen python-pygments cppcheck g++ gcc texlive-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra graphviz && rm -rf /var/lib/apt/lists/* 

