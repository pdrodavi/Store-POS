FROM node:14
                 
RUN apt-get update && apt-get install \
    git libx11-xcb1 libxcb-dri3-0 libxtst6 libnss3 libatk-bridge2.0-0 libgtk-3-0 libxss1 libasound2 \
    -yq --no-install-suggests --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Electron doesn't like to run as root
RUN useradd -d /storepos storepos
USER storepos

WORKDIR /storepos
COPY . .
RUN npm install
RUN npx electron-rebuild

# Electron needs root for sandboxing
# see https://github.com/electron/electron/issues/17972
USER root
RUN chown root /storepos/node_modules/electron/dist/chrome-sandbox
RUN chmod 4755 /storepos/node_modules/electron/dist/chrome-sandbox

USER storepos
CMD npm run start
