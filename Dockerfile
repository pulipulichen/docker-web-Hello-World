# BUILD-USING: docker build -t derbyjs/derby-examples .
# RUN-USING: docker run --name derby-examples --rm derbyjs/derby-examples

# specify base docker image
FROM node:20.2.0-bullseye

RUN apt-get update
RUN apt-get install -y curl wget nano rsync mlocate vim

CMD ["bash", "/startup.sh"]
WORKDIR /opt/

# =================================================================

# =================================================================

COPY package.json /opt/
RUN npm install

# =================================================================

COPY ./docker-build/docker-web/startup.sh /startup.sh