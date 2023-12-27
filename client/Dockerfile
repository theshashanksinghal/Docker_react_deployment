FROM node:16-alpine as stageone
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
# Here we dont mount the volume and copying everything because now we don't want to make changes in the code and see it immediately like in development phase.
COPY . . 

RUN npm run build



FROM nginx
# EXPOSE 80 will do nothing while we are on local but while deploying on beanstalk we ned to tell docker to open port 80 so that 
# loadbalance of elasticbeanstalk can send teh request to port 80.
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
#  since we are using nginx base image, it will automatically start the nginx
COPY --from=stageone /app/build /usr/share/nginx/html