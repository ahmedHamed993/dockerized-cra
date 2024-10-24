# base image 
FROM node:22.8-alpine3.19 AS base 
# development stage 

FROM base AS development
WORKDIR /app
COPY package.json ./
RUN npm install 
COPY . .
EXPOSE 3000
CMD ["npm","run","start"]

# production stage 
FROM base AS production 
WORKDIR /app
COPY package.json ./
RUN npm install --only=production 
COPY . .
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
CMD ["serve","-s","build"]


# build docker image command
# docker build --target development -t dockerized-cra-image .
# run container from the image 
# docker run -p 3000:3000 --name dockerized-cra-container dockerized-cra-image
# with docker compose --build to build the image again 
# docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build 


