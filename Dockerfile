FROM ruby:2.7

ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

#install nodejs and yarn
RUN curl -sL https://deb.nodesource.com/setup_13.x -o /root/node_setup.sh && bash /root/node_setup.sh
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils nodejs yarn

# install rails
RUN gem install rails bundler

WORKDIR /opt/app
EXPOSE 4000/tcp

# create a new rails app called myncm
RUN rails new myncm
WORKDIR /opt/app/myncm
#COPY myncm /opt/app/myncm/
CMD bundle exec rails server -b 0.0.0.0 --port=4000
