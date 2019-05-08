# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
#expose the port
EXPOSE 8090
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=node /app/dist/websolutionbuddy /usr/share/nginx/html
