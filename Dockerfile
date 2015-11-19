FROM nodesource/vivid:4.2.2

RUN apt-get -y update
RUN apt-get --no-install-recommends -y install wget

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

RUN apt-get -y update
RUN apt-get --no-install-recommends -y install ca-certificates openjdk-8-jre-headless xvfb
RUN apt-get -y install google-chrome-stable

RUN rm /etc/apt/sources.list.d/google-chrome.list
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app
RUN git clone https://github.com/CodeYellowBV/run-headless-chromium.git
WORKDIR /app/run-headless-chromium
RUN npm i

CMD ./run-headless-chromium.js --remote-debugging-port=9222
