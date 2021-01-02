FROM node:12

WORKDIR /usr/src/api

COPY package*.json ./

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

RUN npm install # && npm ls --depth=0 # commented this out since it returns non-zero exit code

COPY . .

VOLUME [ "/usr/src/api/node_modules" ]

# not using an execution list here so we get shell variable substitution
CMD /bin/sh -c 'npm run start:$NODE_ENV'
