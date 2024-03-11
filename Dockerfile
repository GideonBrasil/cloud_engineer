FROM node:lts-alpine AS base
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

# Development build
FROM base AS development
ENV NODE_ENV=development
RUN npm install
RUN npm install -g nodemon
COPY . .
EXPOSE 5001
EXPOSE 9229
CMD ["nodemon", "app.ts", "--exec", "ts-node"]

# Production Build
FROM base AS production
ENV NODE_ENV=production
RUN npm install --only=production
COPY . .
EXPOSE 3000
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]