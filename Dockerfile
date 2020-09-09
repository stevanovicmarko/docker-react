FROM node:lts-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- all the stuff
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# NO need for CMD because NGINX has an default start command