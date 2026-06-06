FROM pandoc/core:latest

RUN apk add --no-cache \
    py3-pip \
    py3-cffi \
    pango \
    cairo \
    gdk-pixbuf \
    font-noto-cjk \
    && pip3 install weasyprint --break-system-packages

WORKDIR /work
COPY convert.sh /usr/local/bin/convert.sh
COPY style.css /tools/style.css
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
