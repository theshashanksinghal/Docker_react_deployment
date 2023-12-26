FROM node:16-alpine
WORKDIR "/app"
COPY ./package.json ./
RUN npm install
COPY . .
# NOTE: "start" is the comand that we defined inside package.json file in key-value format
CMD ["npm", "run", "start"]