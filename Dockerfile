FROM node:14-alpine

RUN apk --update add --no-cache bash curl git aws-cli

RUN curl https://cli-assets.heroku.com/install.sh | sh

COPY entrypoint.sh /script.sh
RUN chmod +x /script.sh

ENTRYPOINT ["/bin/bash", "/script.sh"]
