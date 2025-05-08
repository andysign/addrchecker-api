# syntax=docker/dockerfile:1

FROM node:20-alpine

ENV NODE_ENV=production

WORKDIR /app

# COPY ["package.json", "package-lock.json*", "./"]
COPY ["package.json", "package-lock.json*", "./"]

RUN echo "const express = require('express');" >> index.js
RUN echo "const app = express();" >> index.js
RUN echo "app.get('/', (req, res) => { res.send('Hello World!') });" >> index.js
RUN echo "const port = process.env.PORT || 3000;" >> index.js
RUN echo "app.listen(port, () => { console.log(`Server listening on port ${port}`); });" >> index.js

# RUN npm install --production
RUN npm install

# RUN mkdir ./dist/

# COPY ./.env ./.env

# COPY ./.env.deployed ./.env.deployed

# COPY ./dist/ ./dist/

# EXPOSE 8080

EXPOSE 3000

# CMD [ "node", "dist/main.js" ]
CMD [ "node", "index.js" ]

# docker build -t addrchecker-api .
# docker run --rm -h api --name api -p 0.0.0.0:3000:3000 addrchecker-api
# -e PORT="..."
