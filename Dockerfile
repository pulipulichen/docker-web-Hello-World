# BUILD-USING: docker build -t derbyjs/derby-examples .
# RUN-USING: docker run --name derby-examples --rm derbyjs/derby-examples

# specify base docker image
FROM node:20.2.0-bullseye

ADD package.json /app/
ADD docker-build/derby/server.js /app/

# 8001
# EXPOSE 8080
# ADD app/main /var/derby-examples/main

# 8001
# EXPOSE 8001
# ADD app/charts /var/derby-examples/charts

# 8002
# EXPOSE 8002
# ADD app/chat /var/derby-examples/chat

# # 8003
# EXPOSE 8003
# ADD app/codemirror /var/derby-examples/codemirror

# # 8004
# EXPOSE 8004
# ADD app/directory /var/derby-examples/directory

# # 8005
# EXPOSE 8005
# ADD app/hello /var/derby-examples/hello

# # 8006
# EXPOSE 8006
# ADD app/sink /var/derby-examples/sink

# # 8007
# EXPOSE 8007
# ADD app/todos /var/derby-examples/todos

# # 8008
# EXPOSE 8008
# ADD app/widgets /var/derby-examples/widgets

# # 8009
# EXPOSE 8009
# ADD app/render /var/derby-examples/render

# npm install all the things
WORKDIR /app/
RUN npm_config_spin=false npm_config_loglevel=warn npm install --production

# expose any ports we need

# EXPOSE 8002
# EXPOSE 8003
# EXPOSE 8004
# EXPOSE 8005
# EXPOSE 8006
# EXPOSE 8007
# EXPOSE 8008
# EXPOSE 8009
# the command that gets run inside the docker container
CMD ["/usr/local/bin/node", "/app/server.js"]