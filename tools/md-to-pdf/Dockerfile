FROM node:20-slim

# Chromium dependencies — 重いパッケージはレイヤーを分割し、途中クラッシュ時もキャッシュで前進できるようにする
RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends fonts-noto-cjk
RUN apt-get install -y --no-install-recommends chromium
RUN rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV PUPPETEER_SKIP_DOWNLOAD=true

# WSL2/仮想化環境では V8 の並行マーキング GC が `marking_state_->GreyToBlack` で
# クラッシュ（SIGSEGV/SIGILL）する。--no-concurrent-marking で回避する。
# このフラグは NODE_OPTIONS では許可されないため、node 経由で npm を直接起動して渡す。
RUN node --no-concurrent-marking "$(which npm)" install -g md-to-pdf

WORKDIR /work
COPY convert.sh /usr/local/bin/convert.sh
COPY config.js /tools/config.js
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
