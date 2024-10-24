# Dockerized React.JS App With Multi Staging Enviroment

## commands
- to build docker image without using docker compose 
    ```cmd
    docker build --target development -t dockerized-cra-image .
    ```
- to run docker container from the image
    ```cmd
    docker run -p 3000:3000 -d --name dockerized-cra-container dockerized-cra-image
    ```
- using docker compose to build and run a container 
    ```cmd
    docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build 
    ```