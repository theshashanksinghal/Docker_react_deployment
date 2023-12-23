# Dockerfile for produciton phase. We'll dive this into 2 parts:
# First we install npm from node base image and thenbuild the we app,
# Second stage will be we'll build another container with nginx base image and copy the build files from above process and run nginx


FROM node:16-alpine as stageone
WORKDIR '/app'
COPY package.json .
RUN npm install
# Here we dont mount the volume and copying everything because now we don't want to make changes in the code and see it immediately like in development phase.
COPY . . 

RUN npm run build



FROM nginx
#  since we are using nginx base image, it will automatically start the nginx
COPY --from=stageone /app/build /usr/share/nginx/html