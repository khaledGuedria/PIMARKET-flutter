FROM ubuntu:20.04

# Prerequisites
RUN apt-get update && apt-get install -y unzip xz-utils git openssh-client curl && apt-get upgrade -y && rm -rf /var/cache/apt
RUN apt-get install -y curl nano socat unzip wget

ARG DEBIAN_FRONTEND=noninteractive

#Install Chromium
# Packages needed for chromium and add a conf line in pulse
RUN apt-get update && apt-get install -yq --no-install-recommends \
    chromium-browser libgl1-mesa-dri libcanberra-gtk-module libexif-dev pulseaudio \
    && rm -rf /tmp/* /var/{tmp,cache}/* /var/lib/{apt,dpkg}/ \
    && echo enable-shm=no >> /etc/pulse/client.conf

# Create a group and a user with same id of host user
RUN groupadd -f -g 1000 user
RUN adduser --uid 1000 --gid 1000 --disabled-login --gecos 'User' user
ENV HOME /home/user 

# Conf for sound
ENV PULSE_SERVER /run/pulse/native
# The command that run chromium with the home page
CMD ["chromium-browser","--no-sandbox", "--no-first-run","http://google.com"]

# Install flutter beta
RUN curl -L https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_1.22.0-12.1.pre-beta.tar.xz | tar -C /opt -xJ

#Create flutter env
ENV PATH "$PATH:/opt/flutter/bin"

# Initialize web-app
WORKDIR /opt

# Copy it into docker container
COPY . ./

# Enable web capabilities
RUN flutter config --enable-web
RUN flutter upgrade
RUN flutter pub get
#RUN flutter pub global activate webdev
RUN flutter doctor

#Check available devices
RUN flutter devices

#RUN FLUTTER AS WEB APP
RUN flutter run -d chrome