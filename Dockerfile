FROM node:10.15.0
                 
RUN apt-get update                       
RUN apt-get -y install libgtkextra-dev libgconf2-dev libnss3 libasound2 libxtst-dev libxss1

RUN npm install -g electron@4.0.0 --unsafe-perm=true
RUN npm install

CMD ["/usr/local/lib/node_modules/electron/dist/electron"]
