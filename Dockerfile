FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG GRAFFITI=juniormayhe2
ARG NODENAME=juniormayhe2

RUN apt update
RUN apt install -y curl wget 
RUN apt install net-tools 
RUN apt install -y vim
RUN apt install -y git

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt -y install nodejs
RUN apt install -y build-essential libssl-dev curl git-core

RUN node --version
RUN npm --version
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN [ -s "$HOME/.nvm/nvm.sh" ] 
RUN . "$HOME/.nvm/nvm.sh"
RUN . ~/.nvm/nvm.sh
RUN chmod +x /root/.nvm/nvm.sh
RUN /root/.nvm/nvm.sh install v16.15.1

RUN mkdir ~/.npm-global
RUN npm config set prefix '~/.npm-global'
RUN export PATH=~/.npm-global/bin:$PATH
RUN . ~/.profile

RUN export PATH=~/.ironfish:~/.npm-global/lib/node_modules/ironfish/bin:$PATH
RUN echo "export PATH=~/.ironfish:~/.npm-global/lib/node_modules/ironfish/bin:$PATH" >> ~/.bashrc
RUN cat ~/.bashrc
RUN . ~/.profile
RUN chmod +x ~/.bashrc

RUN . ~/.bashrc

RUN npm --location=global install npm@8.13.1
RUN npm --location=global install node-gyp
RUN npm config set user 0
RUN npm --location=global install ironfish

RUN ls -la /root/.npm-global/lib/node_modules/ironfish/bin
RUN find / -name *ironfish* -type d
RUN ~/.npm-global/lib/node_modules/ironfish/bin/ironfish config:set enableTelemetry true

ENV HOME /root
WORKDIR /root
COPY config.json /root/.ironfish/config.json
RUN sed -i "s/\$IRONFISH_GRAFFITI/$GRAFFITI/" /root/.ironfish/config.json
RUN sed -i "s/\$IRONFISH_NODENAME/$NODENAME/" /root/.ironfish/config.json
CMD ["ironfish start"]
