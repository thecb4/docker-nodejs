FROM node:6.11.2

WORKDIR /app

VOLUME /app/public/uploads

# RUN echo "admin" | node app.js apostrophe-users:add admin admin

CMD ./bin/startup
