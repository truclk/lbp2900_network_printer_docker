FROM ubuntu:20.04
# Create a network printer
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y build-essential git autoconf libtool cups libcups2-dev libcupsimage2-dev
RUN apt install -y build-essential git autoconf libtool cups libcups2-dev libcupsimage2-dev
RUN git clone https://github.com/agalakhov/captdriver.git
WORKDIR captdriver
RUN autoreconf -i
RUN ./configure
RUN make
RUN rm -rf /var/lib/apt/lists/*
RUN cp src/rastertocapt /usr/lib/cups/filter/
RUN cp Canon*.ppd /usr/share/ppd/custom/
RUN echo 'root:Printer!' | chpasswd
COPY cupsd.conf /etc/cups/cupsd.conf
COPY printers.conf /etc/cups/printers.conf
RUN cp Canon-LBP2900.ppd /etc/cups/ppd/Canon_LBP2900_docker.ppd
ENTRYPOINT service cups start && bash
