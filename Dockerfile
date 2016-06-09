FROM ubuntu:15.04

RUN apt-get update && apt-get install -y curl software-properties-common git make graphicsmagick g++
RUN curl https://deb.nodesource.com/setup_4.x | bash -
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update && \
  apt-get -y install nodejs

RUN npm install -g bower gulp
RUN printf '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

COPY .babelrc /app/
COPY gulpfile.babel.js /app/
COPY package.json /app/
COPY nginx.conf.sigil /app/

WORKDIR /app

RUN npm install

COPY assets /app/assets/
COPY index.handlebars /app/
COPY app.js /app/

RUN npm run build-production
CMD PORT=80 npm start

EXPOSE 80
