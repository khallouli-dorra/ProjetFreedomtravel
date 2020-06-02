#stage 1 environnement
FROM node:latest as build-step
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

#stage 2 Application 
FROM nginx:alpine
COPY --from=build-step /app/dist/freedomtravel /usr/share/nginx/html
