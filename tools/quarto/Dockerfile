FROM ghcr.io/quarto-dev/quarto:latest

# 重いパッケージはレイヤーを分割し、途中クラッシュ時もキャッシュで前進できるようにする
RUN apt-get update
# xz-utils は TinyTeX の .tar.xz 展開に必須（ベースイメージに含まれない）
RUN apt-get install -y --no-install-recommends xz-utils
RUN apt-get install -y --no-install-recommends fonts-noto-cjk
RUN rm -rf /var/lib/apt/lists/*

# TinyTeX 本体（失敗を握りつぶさず、レイヤーを分離してキャッシュさせる）
RUN quarto install tinytex --no-prompt
# TinyTeX の bin を PATH に追加（tlmgr / xelatex をビルド時・実行時とも利用可能にする）
ENV PATH="/root/.TinyTeX/bin/x86_64-linux:${PATH}"
# tlmgr の実行に必須なツール（tinytex の重いキャッシュを保持するため tinytex 層より後に置く）:
#   - perl : ベースイメージは perl-base のみで File::Find 等が欠ける
#   - wget : tlmgr がパッケージ取得に使うダウンローダー（curl/wget いずれも未導入のため）
RUN apt-get update && apt-get install -y --no-install-recommends perl wget && rm -rf /var/lib/apt/lists/*
# 日本語 TeX パッケージ。
# xecjk は collection-langcjk には含まれず、quarto の xelatex+CJK レンダリングに必須のため個別に指定する。
RUN tlmgr install collection-langcjk xetex-pstricks xecjk
# libfontconfig1 は xelatex がフォント検索に必須（ベースイメージに含まれない）。
# TinyTeX/tlmgr のキャッシュを壊さないよう tlmgr install より後に配置する。
RUN apt-get update && apt-get install -y --no-install-recommends libfontconfig1 && rm -rf /var/lib/apt/lists/*

WORKDIR /work
COPY convert.sh /usr/local/bin/convert.sh
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
