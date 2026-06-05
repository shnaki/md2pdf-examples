FROM ghcr.io/quarto-dev/quarto:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-noto-cjk \
    && rm -rf /var/lib/apt/lists/*

# Install TinyTeX with Japanese TeX packages
RUN quarto install tinytex --no-prompt && \
    tlmgr install collection-langcjk xetex-pstricks || true

WORKDIR /work
COPY convert.sh /usr/local/bin/convert.sh
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
