FROM node:14-alpine

RUN apk --update add --no-cache bash curl git aws-cli

RUN curl https://cli-assets.heroku.com/install.sh | sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
