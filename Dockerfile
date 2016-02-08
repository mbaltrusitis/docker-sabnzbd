FROM timhaak/base:latest
MAINTAINER Tim Haak <tim@haak.co>

RUN add-apt-repository -y  ppa:jcfp/ppa && \
    apt-get -q update && \
    apt-get install -qy --force-yes  sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush \
    par2 python-yenc unzip unrar && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME "/configdata/sabnzbd"
VOLUME "/mediadata/"

EXPOSE 8080 9090

CMD ["/usr/bin/sabnzbdplus","--config-file","/configdata/sabnzbd","--console","--server", "0.0.0.0:8080"]
