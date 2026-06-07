#!/bin/bash
set -euo pipefail

# WSL2/仮想化環境では V8 の並行マーキング GC が `marking_state_->GreyToBlack` で
# クラッシュ（SIGSEGV/SIGILL）するため、--no-concurrent-marking で回避する。
# NODE_OPTIONS では許可されないフラグなので、md-to-pdf を node 経由で起動して渡す。
MD_TO_PDF_BIN=$(command -v md-to-pdf)
run_md_to_pdf() { node --no-concurrent-marking "${MD_TO_PDF_BIN}" "$@"; }

TOOL=md-to-pdf
OUT=/work/outputs/${TOOL}
mkdir -p "${OUT}"

for f in /work/samples/*.md; do
    base=$(basename "${f}" .md)
    echo "==> ${base}"
    # md-to-pdf には出力先指定オプションが無く、入力の隣に <name>.pdf を生成するため後で移動する
    run_md_to_pdf "${f}" \
        --config-file=/tools/config.js \
        2>&1
    mv "${f%.md}.pdf" "${OUT}/${base}.pdf"
done

echo ""
echo "Done: ${TOOL}"
ls -lh "${OUT}/"
