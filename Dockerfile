FROM ghcr.io/container-projects/containerized-jhipster-generator-template:main

USER root

RUN npm install -g generator-jhipster-react-native eas-cli

USER generator
ENV PATH $PATH:/usr/bin
WORKDIR "/home/generator/app"
VOLUME ["/home/generator/app"]

CMD ["jhipster", "--blueprints", "react-native"]
