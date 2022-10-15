FROM debian
RUN apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y tigervnc-standalone-server xfce4 fonts-liberation dbus-x11 chromium xfce4-terminal \
  build-essential ffmpeg vim tmux fonts-noto fonts-noto-cjk fonts-noto-color-emoji xdotool git wget curl sudo htop \
  && \
  rm -rf /var/lib/apt/lists
ENV VNC_DESKTOP_NAME "Xtigervnc"
ENV VNC_GEOMETRY 1920x1080
ENV DISPLAY :0
RUN wget https://github.com/deref/exo/releases/download/2021.11.16/exo_2021.11.16_linux_amd64.deb && apt install -y ./exo_2021.11.16_linux_amd64.deb
RUN useradd --create-home --shell /bin/bash desktop -u 1000
RUN echo 'desktop ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
COPY ./opt/ /opt/
COPY ./Procfile /Procfile
COPY ./home/desktop/ /home/desktop/
RUN sudo chown -R desktop:desktop /home/desktop
USER desktop
CMD exo run
