FROM node:8-slim

ADD https://github.com/jgm/pandoc/releases/download/2.7.1/pandoc-2.7.1-1-amd64.deb /tmp/

RUN apt update && \
    apt upgrade -y && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:texlive-backports/ppa && \
    apt install fontconfig bzip2 texlive texlive-xetex texlive-math-extra texlive-fonts-recommended texlive-fonts-extra ttf-liberation \
    xvfb gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 librsvg2-bin \
    libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 \
    libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
    libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
    libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget -y && \
    npm -i g npm && \
    fc-cache -f -v && \
    rm -rf /var/lib/apt/lists/* && \
    dpkg -i /tmp/*.deb && \
    npm install --global mermaid-filter --unsafe-perm=true --allow-root
