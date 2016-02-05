FROM jsurf/rpi-java
RUN apt-get update && apt-get install -y \
        msmtp \
        tcl \
        tcllib \
        libusb-1.0-0-dev \
        supervisor \
#        unzip \
#        rsyslog \
        --no-install-recommends && \
        rm -rf /var/lib/apt/lists/*
COPY HMserver /
COPY firmware/ /firmware/
COPY arm-gnueabihf/packages/lighttpd/ /
COPY arm-gnueabihf/packages-eQ-3/HS485D/ /
COPY arm-gnueabihf/packages-eQ-3/RFD/ /
COPY arm-gnueabihf/packages-eQ-3/WebUI/ /
COPY arm-gnueabihf/packages-eQ-3/LinuxBasis/ /
COPY WebUI/ /
COPY HMserver/ /
RUN ln -s / /opt/hm && \
    rm -rf /usr/local/* && \
    mkdir -p /usr/local/etc && \
    mv /etc/config /usr/local/etc/ && \
    ln -s /usr/local/etc/config /etc/config
COPY supervisor/ /etc/supervisor/
COPY VERSION /boot/

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisor/supervisor.conf"]
