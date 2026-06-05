#!/bin/bash
set -euo pipefail

TOOL=md-to-pdf
OUT=/work/outputs/${TOOL}
mkdir -p "${OUT}"

for f in /work/samples/*.md; do
    base=$(basename "${f}" .md)
    echo "==> ${base}"
    md-to-pdf "${f}" \
        --config-file=/tools/config.js \
        --dest="${OUT}/${base}.pdf" \
        2>&1
done

echo ""
echo "Done: ${TOOL}"
ls -lh "${OUT}/"
