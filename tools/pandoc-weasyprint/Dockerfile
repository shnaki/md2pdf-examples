FROM pandoc/core:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    fonts-noto-cjk \
    libpango-1.0-0 \
    libpangoft2-1.0-0 \
    libcairo2 \
    libgdk-pixbuf2.0-0 \
    libffi-dev \
    && pip3 install weasyprint --break-system-packages \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
COPY convert.sh /usr/local/bin/convert.sh
COPY style.css /tools/style.css
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
