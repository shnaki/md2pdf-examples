#!/bin/bash
set -euo pipefail

TOOL=pandoc-xelatex
OUT=/work/outputs/${TOOL}
mkdir -p "${OUT}"

# Pre-convert SVGs to PDF for XeLaTeX compatibility
for svg in /work/samples/assets/*.svg; do
    pdf="${svg%.svg}.pdf"
    if [ ! -f "${pdf}" ]; then
        rsvg-convert -f pdf -o "${pdf}" "${svg}" 2>/dev/null || true
    fi
done

for f in /work/samples/*.md; do
    base=$(basename "${f}" .md)
    echo "==> ${base}"
    pandoc "${f}" \
        -o "${OUT}/${base}.pdf" \
        --pdf-engine=xelatex \
        --resource-path=/work/samples \
        --include-in-header=/tools/header.tex \
        -V lang=ja \
        -V CJKmainfont="Noto Serif CJK JP" \
        -V CJKsansfont="Noto Sans CJK JP" \
        -V CJKmonofont="Noto Sans Mono CJK JP" \
        -V mainfont="Noto Serif CJK JP" \
        -V sansfont="Noto Sans CJK JP" \
        -V monofont="Noto Sans Mono CJK JP" \
        -V geometry:margin=25mm \
        --toc \
        --highlight-style=breezedark \
        --number-sections \
        2>&1
done

echo ""
echo "Done: ${TOOL}"
ls -lh "${OUT}/"
