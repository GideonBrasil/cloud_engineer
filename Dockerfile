# Build argument for NODE_ENV, default to production
# ARG NODE_ENV=prod

FROM node:lts-alpine AS base
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

# Builds
# FROM base AS development
# ENV NODE_ENV=${NODE_ENV}
# RUN if [ "$NODE_ENV" = "dev" ]; then \
#         npm install && npm test; \
#     else \
#         npm install --only=production; \
#     fi
# COPY . .
# EXPOSE 3000 5001
# CMD if [ "$NODE_ENV" = "dev" ]; then \
#         npm run dev; else npm start; fi

# Production Build
# FROM base AS production
# ENV NODE_ENV=${NODE_ENV}
# RUN npm install --only=production
# COPY . .
# EXPOSE 3000
# RUN chown -R node /usr/src/app
# USER node
# CMD ["npm", "start"]

# Production Build
FROM base AS development
ENV NODE_ENV=development
COPY . .
RUN npm install
RUN npm test
EXPOSE 3000
RUN chown -R node /usr/src/app
USER node
CMD [ "npm", "run", "dev" ]
# CMD ["npx", "nodemon", "app.ts", "--exec","ts-node"]