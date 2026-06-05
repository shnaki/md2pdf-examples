#!/bin/bash
set -euo pipefail

TOOL=quarto
OUT=/work/outputs/${TOOL}
mkdir -p "${OUT}"

for f in /work/samples/*.md; do
    base=$(basename "${f}" .md)
    echo "==> ${base}"
    quarto render "${f}" \
        --to pdf \
        --output "${base}.pdf" \
        --output-dir "${OUT}" \
        -M lang:ja \
        -M pdf-engine:xelatex \
        -M CJKmainfont:"Noto Serif CJK JP" \
        -M toc:true \
        -M number-sections:true \
        2>&1
done

echo ""
echo "Done: ${TOOL}"
ls -lh "${OUT}/"
