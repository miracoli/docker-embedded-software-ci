FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gcc-avr binutils-avr avr-libc wget unzip cmake autoconf gcovr lcov libgtest-dev libboost-test-dev doxygen python-pygments cppcheck g++ gcc texlive-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra graphviz && rm -rf /var/lib/apt/lists/* 

WORKDIR /opt
RUN mkdir packs
WORKDIR /opt/packs
RUN wget -q http://packs.download.atmel.com/Atmel.ATtiny_DFP.1.4.310.atpack http://packs.download.atmel.com/Atmel.SAML21_DFP.1.2.125.atpack http://packs.download.atmel.com/Atmel.ATmega_DFP.1.4.351.atpack http://packs.download.atmel.com/Atmel.SAMD21_DFP.1.3.395.atpack
RUN mv Atmel.ATtiny_DFP.1.4.310.atpack Atmel.ATtiny_DFP.1.4.310.zip
RUN mv Atmel.ATmega_DFP.1.4.351.atpack Atmel.ATmega_DFP.1.4.351.zip
RUN mv Atmel.SAMD21_DFP.1.3.395.atpack Atmel.SAMD21_DFP.1.3.395.zip
RUN mv Atmel.SAML21_DFP.1.2.125.atpack Atmel.SAML21_DFP.1.2.125.zip
RUN unzip Atmel.ATtiny_DFP.1.4.310.zip
RUN unzip Atmel.ATmega_DFP.1.4.351.zip
RUN unzip Atmel.SAMD21_DFP.1.3.395.zip
RUN unzip Atmel.SAML21_DFP.1.2.125.zip
RUN rm Atmel.ATtiny_DFP.1.4.310.zip
RUN rm Atmel.ATmega_DFP.1.4.351.zip
RUN rm Atmel.SAMD21_DFP.1.3.395.zip
RUN rm Atmel.SAML21_DFP.1.2.125.zip
