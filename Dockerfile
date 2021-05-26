# FROM node:alpine as builder    <- Does not work with AWS
FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#COPY --from=builder /app/build /usr/share/nginx/html   <- Does not work with AWS
COPY --from=0 /app/build /usr/share/nginx/html