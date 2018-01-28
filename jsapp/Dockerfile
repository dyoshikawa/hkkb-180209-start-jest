FROM node:alpine

# install bash nginx
RUN apk --update add bash nginx

# install sudo and set dockeruser sudoer
RUN apk add sudo \
 && echo 'node ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# setup nginx
RUN sed -i 's/user\ \ nginx\;/user\ \ 1000\;/g' /etc/nginx/nginx.conf \
 && mkdir /run/nginx
ADD server.conf /etc/nginx/conf.d/default.conf

# setup pre-workdir
RUN mkdir -p /var/www/jsapp-pre/src \
 && mkdir /var/www/jsapp-pre/src/js \
 && mkdir /var/www/jsapp-pre/src/scss
WORKDIR /var/www/jsapp-pre

# add files
ADD package.json package.json
ADD .babelrc .babelrc
ADD webpack.config.js webpack.config.js
ADD index.html index.html
ADD main.js ./src/js/main.js
ADD sum.js ./src/js/sum.js
ADD sum.test.js ./src/js/sum.test.js
ADD style.scss ./src/scss/style.scss

# install node-modules
RUN npm install --save-dev webpack babel-cli babel-preset-env babel-loader node-sass \
                           jest babel-jest regenerator-runtime \
 && npm install --save bootstrap jquery popper.js \
 && npm run build

# setup workdir
RUN mkdir /var/www/jsapp
WORKDIR /var/www/jsapp

# setup entrypoint
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
USER node
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]