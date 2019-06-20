FROM ubuntu:19.04

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y python3-pip wget openocd

RUN pip3 install click intelhex PyYAML colorama intervaltree numpy pycryptodome unicorn
WORKDIR /tmp
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2
RUN bzip2 -d gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2 \
    && tar -xvf gcc-arm-none-eabi-8-2018-q4-major-linux.tar \
    && cp -r /tmp/gcc-arm-none-eabi-8-2018-q4-major/* /usr/local/ \
    && rm -r /tmp/gcc-arm-none-eabi-8-2018-q4-major \
    && rm /tmp/gcc-arm-none-eabi-8-2018-q4-major-linux.tar

ENTRYPOINT [ "/bin/bash" ]