FROM pandoc/extra:latest

# Japanese fonts and SVG conversion support
RUN apk add --no-cache \
    font-noto-cjk \
    librsvg

WORKDIR /work
COPY convert.sh /usr/local/bin/convert.sh
COPY header.tex /tools/header.tex
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
