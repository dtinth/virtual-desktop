FROM debian
RUN apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y tigervnc-standalone-server xfce4 fonts-liberation dbus-x11 chromium xfce4-terminal \
  build-essential ffmpeg vim tmux fonts-noto fonts-noto-cjk fonts-noto-color-emoji xdotool git wget curl sudo htop \
  && \
  rm -rf /var/lib/apt/lists
ENV VNC_DESKTOP_NAME "Xtigervnc"
ENV VNC_GEOMETRY 1920x1080
ENV DISPLAY :0
RUN wget https://github.com/F1bonacc1/process-compose/releases/download/v0.51.4/process-compose_Linux_x86_64.tar.gz -O- | tar xvz -C /usr/local/bin process-compose
RUN useradd --create-home --shell /bin/bash desktop -u 1000
RUN echo 'desktop ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
COPY ./opt/ /opt/
COPY ./process-compose.yml /process-compose.yml
COPY ./home/desktop/ /home/desktop/
COPY ./etc/ /etc/
RUN sudo chown -R desktop:desktop /home/desktop
USER desktop
CMD process-compose -f /process-compose.yml up -t=false
