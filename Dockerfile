FROM ghcr.io/hassio-addons/debian-base:7.1.0

LABEL io.hass.version="1.0" io.hass.type="addon" io.hass.arch="aarch64|amd64"

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Update and install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        locales \
        cups \
        avahi-daemon \
        libnss-mdns \
        dbus \
        colord \
        printer-driver-all \
        printer-driver-gutenprint \
        openprinting-ppds \
        hpijs-ppds \
        hp-ppd  \
        hplip \
        printer-driver-foo2zjs \
        cups-pdf \
        gnupg2 \
        lsb-release \
        nano \
        samba \
        bash-completion \
        procps \
        whois \
        build-essential \
        libcups2-dev \
        libcupsimage2-dev \
        autoconf \
        automake \
        libtool \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Copy the Epson source code and root filesystem into the image
COPY epson-inkjet-printer-escpr-1.8.4-1.tar /tmp/
COPY rootfs /

# Unpack, build, and install the Epson printer driver from source
RUN tar xf /tmp/epson-inkjet-printer-escpr-1.8.4-1.tar -C /tmp/ \
    && cd /tmp/epson-inkjet-printer-escpr-1.8.4-1 \
    && ./configure \
    && make \
    && make install \
    # Clean up
    && cd / \
    && rm -rf /tmp/epson-inkjet-printer-escpr-1.8.4-1 \
    && rm -f /tmp/epson-inkjet-printer-escpr-1.8.4-1.tar

# Add user and disable sudo password checking
RUN useradd \
  --groups=sudo,lp,lpadmin \
  --create-home \
  --home-dir=/home/print \
  --shell=/bin/bash \
  --password=$(mkpasswd print) \
  print \
&& sed -i '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers

EXPOSE 631

RUN chmod a+x /run.sh

CMD ["/run.sh"]
