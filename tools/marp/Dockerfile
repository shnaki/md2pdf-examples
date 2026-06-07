FROM node:20-slim

# 重いパッケージはレイヤーを分割し、途中クラッシュ時もキャッシュで前進できるようにする
RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends fonts-noto-cjk
RUN apt-get install -y --no-install-recommends chromium
RUN rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV PUPPETEER_SKIP_DOWNLOAD=true
# marp-cli は CHROME_PATH を参照する
ENV CHROME_PATH=/usr/bin/chromium

RUN NODE_OPTIONS=--jitless npm install -g @marp-team/marp-cli

WORKDIR /work
COPY convert.sh /usr/local/bin/convert.sh
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
