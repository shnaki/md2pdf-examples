FROM marpteam/marp-cli:latest

USER root
RUN apk add --no-cache \
    font-noto-cjk \
    || (apt-get update && apt-get install -y --no-install-recommends fonts-noto-cjk && rm -rf /var/lib/apt/lists/*) \
    || true

COPY convert.sh /usr/local/bin/convert.sh
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
