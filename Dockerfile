# stage build
FROM --platform=linux/amd64 node:lts-alpine3.21 as builder

WORKDIR /app

# update system dependencies
RUN apk update && npm install -g npm@latest

COPY . .

RUN npm ci && npm audit fix && npm run build

# stage run
FROM --platform=linux/amd64 node:lts-alpine3.21

WORKDIR /app

# update system dependencies
RUN apk update && npm install -g npm@latest

COPY --from=builder /app/package*.json ./

RUN npm ci --production --ignore-scripts && npm audit fix

# copy built SvelteKit app to /app
COPY --from=builder /app/build ./

EXPOSE 3000
CMD ["node", "./index.js"]