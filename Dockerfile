FROM ubuntu:16.04
MAINTAINER Matthew Baltrusitis <matthew@baltrusitis.com>

ENV DEBIAN_FRONTEND="noninteractive"
ENV HOME /opt/sabnzbd
ENV SCRIPT_PATH $HOME/scripts

RUN apt-get -qy update && \
    apt-get install -qy software-properties-common && \
		add-apt-repository multiverse && \
		apt-get -qy update && \
		apt-get install -qy \
      sabnzbdplus \
      sabnzbdplus-theme-classic \
      sabnzbdplus-theme-mobile \
      sabnzbdplus-theme-plush \
      unrar \
      unzip \
      p7zip \
      ffmpeg \
      par2 \
      python-yenc \
      python-openssl \
      unzip \
      unrar && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["${HOME}", "${SCRIPT_PATH}"]
EXPOSE 8080 9090

CMD ["sabnzbdplus", "-b", "0", "-s", "0.0.0.0:8080", "--https", "9090"]

