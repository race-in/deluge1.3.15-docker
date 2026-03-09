FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
wget curl nano procps iproute2 \
build-essential python2 python2-dev python-pkg-resources \
libboost-dev libssl-dev libgeoip-dev \
geoip-database intltool librsvg2-common xdg-utils \
&& rm -rf /var/lib/apt/lists/*

RUN curl -L https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py \
 && python2 get-pip.py

RUN pip2 install Twisted==20.3.0 Automat==0.8.0 service-identity mako chardet pyopenssl pyxdg

RUN wget https://raw.githubusercontent.com/jerry048/Seedbox-Components/main/Torrent%20Clients/Deluge/boost/boost-1-69-0_20220512-1_amd64.deb \
 && dpkg -i boost-1-69-0_20220512-1_amd64.deb

RUN wget https://raw.githubusercontent.com/jerry048/Seedbox-Components/main/Torrent%20Clients/Deluge/libtorrent/bullseye_libtorrent-rasterbar_1.1.14-amd64.deb \
 && dpkg -i bullseye_libtorrent-rasterbar_1.1.14-amd64.deb

RUN wget http://download.deluge-torrent.org/source/1.3/deluge-1.3.15.tar.xz \
 && tar xf deluge-1.3.15.tar.xz \
 && cd deluge-1.3.15 \
 && python2 setup.py build \
 && python2 setup.py install

RUN mkdir -p /root/.config/deluge/plugins \
 && wget https://github.com/ratanakvlun/deluge-ltconfig/releases/download/v0.3.1/ltConfig-0.3.1-py2.7.egg \
 && mv ltConfig-0.3.1-py2.7.egg /root/.config/deluge/plugins/

COPY start.sh /start.sh
COPY core.conf /core.conf
COPY ltconfig.conf /ltconfig.conf

RUN chmod +x /start.sh

EXPOSE 8113

CMD ["/start.sh"]
