# stage build
FROM node:current-alpine3.17 as builder

WORKDIR /app

# update system dependencies
RUN apk update

COPY . .

RUN npm ci && npm audit fix && npm run build

# stage run
FROM node:current-alpine3.17

WORKDIR /app

COPY --from=builder /app/package*.json ./

RUN npm ci --production --ignore-scripts && npm audit fix

# copy built SvelteKit app to /app
COPY --from=builder /app/build ./

EXPOSE 3000
CMD ["node", "./index.js"]