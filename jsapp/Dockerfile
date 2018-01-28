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
RUN mkdir -p /var/www/vuejs-pre/{src, dist} \
 && mkdir /var/www/vuejs-pre/src/{js, scss}
WORKDIR /var/www/vuejs-pre

ADD package.json package.json
ADD .babelrc .babelrc
ADD webpack.config.js webpack.config.js
ADD index.html index.html
ADD style.scss ./src/scss/style.scss

# install node-modules
RUN npm install --save-dev webpack babel-cli babel-preset-env babel-loader node-sass \
                           jest babel-jest regenerator-runtime \
 && npm install --save bootstrap jquery popper.js \
 && npm run build

# set workdir
RUN mkdir /var/www/vuejs
WORKDIR /var/www/vuejs

# setup entrypoint
ADD vuejs-entrypoint.sh /vuejs-entrypoint.sh
RUN chmod 777 /vuejs-entrypoint.sh
USER node
ENTRYPOINT ["bash", "/vuejs-entrypoint.sh"]