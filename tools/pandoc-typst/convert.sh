#!/bin/bash
set -euo pipefail

TOOL=pandoc-typst
OUT=/work/outputs/${TOOL}
mkdir -p "${OUT}"

for f in /work/samples/*.md; do
    base=$(basename "${f}" .md)
    echo "==> ${base}"
    pandoc "${f}" \
        -o "${OUT}/${base}.pdf" \
        --pdf-engine=typst \
        --resource-path=/work/samples \
        --template=/tools/template.typ \
        2>&1
done

echo ""
echo "Done: ${TOOL}"
ls -lh "${OUT}/"
