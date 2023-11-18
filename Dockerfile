FROM node:slim
COPY . /usr/scr/app
RUN apt-get update
RUN apt-get -y install libgtkextra-dev libgconf2-dev libnss3 libasound2 libxtst-dev libxss1
RUN npm install --save-dev electron
#WORKDIR /app
#COPY package*.json ./
RUN npm install
#COPY . .
EXPOSE 3000
#CMD npm run electron
CMD ["/usr/scr/app/start.sh"]
