FROM ubuntu:20.04

# Prerequisites
RUN apt-get update && apt-get install -y unzip xz-utils git openssh-client curl && apt-get upgrade -y && rm -rf /var/cache/apt

ARG DEBIAN_FRONTEND=noninteractive

# Install flutter beta
RUN curl -L https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_1.22.0-12.1.pre-beta.tar.xz | tar -C /opt -xJ

#Create flutter env
ENV PATH "$PATH:/opt/flutter/bin"

# Switch to
WORKDIR /opt

# Copy it into docker container
COPY . ./

# Enable web capabilities
RUN flutter config --enable-web
RUN flutter upgrade

#Install flutter dependencies
RUN flutter pub get

#Check flutter Prerequisites
RUN flutter doctor

#Enable flutter web for old projects
RUN flutter create .