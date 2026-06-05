#!/bin/sh
set -eu

TOOL=marp
OUT=/work/outputs/${TOOL}
mkdir -p "${OUT}"

for f in /work/samples-marp/*.md; do
    base=$(basename "${f}" .md)
    echo "==> ${base}"
    marp "${f}" \
        --pdf \
        --allow-local-files \
        -o "${OUT}/${base}.pdf" \
        2>&1
done

echo ""
echo "Done: ${TOOL}"
ls -lh "${OUT}/"
