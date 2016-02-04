FROM jsurf/rpi-java
RUN apt-get update && apt-get install -y \
        msmtp \
        tcl \
        tcllib \
        libusb-1.0-0-dev \
#        unzip \
#        rsyslog \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*

COPY arm-gnueabihf/packages/lighttpd/ /
COPY arm-gnueabihf/packages-eQ-3/HS485D/ /
COPY arm-gnueabihf/packages-eQ-3/RFD/ /
COPY arm-gnueabihf/packages-eQ-3/WebUI/ /
COPY arm-gnueabihf/packages-eQ-3/LinuxBasis/ /
COPY arm-gnueabihf/start_hm.sh /
COPY WebUI /
COPY HMserver /
COPY firmware/ /firmware/
RUN ln -s / /opt/hm
#CMD ['start_hm.sh']
