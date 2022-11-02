FROM ghcr.io/container-projects/node-14-npm-yo-containerized:master

RUN npm install -g generator-jhipster-react-native eas-cli

RUN npm install -g generator-jhipster

RUN \
  # configure the "generator" user
  groupadd generator && \
  useradd generator -s /bin/bash -m -g generator -G sudo && \
  echo generator:generator |chpasswd 
RUN mkdir /home/generator/app
USER generator
ENV PATH $PATH:/usr/bin
WORKDIR "/home/generator/app"
VOLUME ["/home/generator/app"]

CMD ["jhipster", "--blueprints", "react-native"]
