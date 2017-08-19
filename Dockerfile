FROM node:6.11.2

# http://keystonejs.com/getting-started/
# RUN npm install -g generator-keystone

# RUN useradd -d /home/thecb4 -m -s /bin/bash thecb4 && echo "thecb4:thecb4" | chpasswd && adduser thecb4 sudo

ENV APP_USER
ENV GH_TOKEN
ENV APP_NAME
ENV GH_REPO

RUN groupadd $APP_USER
RUN useradd $APP_USER -s /bin/bash -m -g $APP_USER -G sudo &&  echo '$APP_USER:$APP_USER' | chpasswd
# RUN mkdir /home/voyager/app

# # Set environmental vars
# ARG GH_TOKEN=WRONG_GITHUB_TOKEN

# RUN \
#   # configure the "jhipster" user
#   groupadd jhipster && \
#   useradd jhipster -s /bin/bash -m -g jhipster -G sudo && \
#   echo 'jhipster:jhipster' |chpasswd && \
#   mkdir /home/jhipster/app

# RUN chown -R thecb4:thecb4 /home/thecb4

USER $APP_USER

RUN mkdir /home/$APP_USER/$APP_NAME
#
# RUN chown -R voyager:voyager /home/voyager/app

# Adding the whole project from the repo to the container
RUN git clone https://$GH_TOKEN:x-oauth-basic@github.com/$GH_REPO.git /home/$APP_USER/$APP_NAME
#
WORKDIR /home/$APP_USER/$APP_NAME

# COPY package.json /node/lib/
# WORKDIR /node/lib/
# RUN npm install
# ENV PATH /node/lib/node_modules/.bin:$PATH

# RUN npm install

# CMD /bin/bash -c 'npm install; npm start'

# CMD ["./run.sh"]

CMD npm install && npm start
