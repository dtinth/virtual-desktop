FROM debian
RUN apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y tigervnc-standalone-server xfce4 fonts-liberation dbus-x11 \
  build-essential ffmpeg vim tmux fonts-noto fonts-noto-cjk fonts-noto-color-emoji xdotool git wget curl sudo \
  && \
  rm -rf /var/lib/apt/lists
RUN wget -O- https://github.com/mattn/goreman/releases/download/v0.3.13/goreman_v0.3.13_linux_amd64.tar.gz | tar xvz --strip-components=1 -C /usr/local/bin
ENV VNC_DESKTOP_NAME "Xtigervnc"
ENV VNC_GEOMETRY 1920x1080
RUN useradd --create-home --shell /bin/bash desktop -u 1000
RUN echo 'desktop ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
COPY ./opt/ /opt/
COPY ./Procfile /Procfile
USER desktop
CMD goreman start
