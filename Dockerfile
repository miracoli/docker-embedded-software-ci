FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gcc-avr binutils-avr avr-libc wget unzip cmake autoconf gcovr lcov libgtest-dev libboost-test-dev doxygen python-pygments cppcheck g++ gcc texlive-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra graphviz && rm -rf /var/lib/apt/lists/* 

WORKDIR /opt
RUN mkdir packs
WORKDIR /opt/packs
RUN wget -q http://packs.download.atmel.com/Atmel.ATtiny_DFP.1.4.310.atpack
RUN mv Atmel.ATtiny_DFP.1.4.310.atpack Atmel.ATtiny_DFP.1.4.310.zip
RUN unzip Atmel.ATtiny_DFP.1.4.310.zip
RUN rm Atmel.ATtiny_DFP.1.4.310.zip
