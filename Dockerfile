FROM node:16.14.2 AS builder

ENV NODE_ENV production

# Add a work directory
WORKDIR /app

# Install dependencies
COPY package.json .
COPY package-lock.json .
RUN yarn install --production

# Copy app files
COPY . .

# Build the app
RUN yarn build

FROM nginx:1.21.0-alpine as production

ENV NODE_ENV production

COPY --from=builder /app/build /usr/share/nginx/html

# Add your nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
