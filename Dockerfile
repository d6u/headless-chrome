FROM nodesource/vivid:4.2.2

RUN apt-get update -qqy && apt-get -qqy install xvfb wget && rm -rf /var/lib/apt/lists/*
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update
RUN apt-get install -y google-chrome-stable

CMD xvfb-run --server-args='-screen 0, 1024x768x16' google-chrome --remote-debugging-port 9222
