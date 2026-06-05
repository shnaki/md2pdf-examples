FROM pandoc/extra:latest

# Japanese fonts and SVG conversion support
RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-noto-cjk \
    librsvg2-bin \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
COPY convert.sh /usr/local/bin/convert.sh
COPY header.tex /tools/header.tex
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
