FROM debian:buster-slim
ENV VERSION v1.0
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN /bin/bash -c 'set -ex && \
    ARCH=`uname -m` && \
    if [ "$ARCH" == "x86_64" ]; then \
       echo "x86_64" && \
       apt-get install -y ninja-build gcc-arm-none-eabi gcc-avr binutils-avr avr-libc wget git unzip cmake autoconf gcovr lcov libgtest-dev libboost1.67-all-dev python-pygments cppcheck g++ gcc doxygen-latex graphviz valgrind strace g++-multilib gcc-multilib && rm -rf /var/lib/apt/lists/* ; \
    else \
       echo "unknown arch" && \
       apt-get install -y ninja-build gcc-arm-none-eabi gcc-avr binutils-avr avr-libc wget git unzip cmake autoconf gcovr lcov libgtest-dev libboost1.67-all-dev python-pygments cppcheck g++ gcc doxygen-latex graphviz valgrind strace && rm -rf /var/lib/apt/lists/* ; \
    fi'

WORKDIR /opt
RUN mkdir packs
WORKDIR /opt/packs
WORKDIR /opt/packs
RUN wget -q http://packs.download.atmel.com/Atmel.ATtiny_DFP.1.4.310.atpack http://packs.download.atmel.com/Atmel.SAML21_DFP.1.2.125.atpack http://packs.download.atmel.com/Atmel.ATmega_DFP.1.4.351.atpack http://packs.download.atmel.com/Atmel.SAMD21_DFP.1.3.395.atpack http://packs.download.atmel.com/ARM.CMSIS.5.4.0.atpack
RUN mv Atmel.ATtiny_DFP.1.4.310.atpack Atmel.ATtiny_DFP.1.4.310.zip
RUN mv Atmel.ATmega_DFP.1.4.351.atpack Atmel.ATmega_DFP.1.4.351.zip
RUN mv Atmel.SAMD21_DFP.1.3.395.atpack Atmel.SAMD21_DFP.1.3.395.zip
RUN mv Atmel.SAML21_DFP.1.2.125.atpack Atmel.SAML21_DFP.1.2.125.zip
RUN mv ARM.CMSIS.5.4.0.atpack ARM.CMSIS.5.4.0.zip
RUN unzip -d attiny Atmel.ATtiny_DFP.1.4.310.zip
RUN unzip -d atmega Atmel.ATmega_DFP.1.4.351.zip
RUN unzip -d samd21 Atmel.SAMD21_DFP.1.3.395.zip
RUN unzip -d saml21 Atmel.SAML21_DFP.1.2.125.zip
RUN unzip -d cmsis ARM.CMSIS.5.4.0.zip
RUN rm Atmel.ATtiny_DFP.1.4.310.zip
RUN rm Atmel.ATmega_DFP.1.4.351.zip
RUN rm Atmel.SAMD21_DFP.1.3.395.zip
RUN rm Atmel.SAML21_DFP.1.2.125.zip
RUN rm ARM.CMSIS.5.4.0.zip
