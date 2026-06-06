FROM pandoc/extra:latest

ARG TYPST_VERSION=0.13.1

RUN apk add --no-cache \
    curl \
    xz \
    font-noto-cjk \
    && curl -L "https://github.com/typst/typst/releases/download/v${TYPST_VERSION}/typst-x86_64-unknown-linux-musl.tar.xz" \
       | tar -xJ --strip-components=1 -C /usr/local/bin/

WORKDIR /work
COPY convert.sh /usr/local/bin/convert.sh
COPY template.typ /tools/template.typ
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
