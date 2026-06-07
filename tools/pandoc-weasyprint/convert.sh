#!/bin/bash
set -euo pipefail

TOOL=pandoc-weasyprint
OUT=/work/outputs/${TOOL}
mkdir -p "${OUT}"

for f in /work/samples/*.md; do
    base=$(basename "${f}" .md)
    echo "==> ${base}"
    # pandoc → HTML5 → WeasyPrint → PDF
    pandoc "${f}" \
        -t html5 \
        --standalone \
        --embed-resources \
        --resource-path=/work/samples \
        --css=/tools/style.css \
        --mathjax \
        --toc \
        --number-sections \
        | weasyprint - "${OUT}/${base}.pdf" \
            --stylesheet=/tools/style.css \
            2>&1
done

echo ""
echo "Done: ${TOOL}"
ls -lh "${OUT}/"
