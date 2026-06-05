---
title: コードブロックのサンプル
lang: ja
---

# コードブロック

## Python

```python
from typing import Iterator

def fibonacci(n: int) -> Iterator[int]:
    """フィボナッチ数列を生成するジェネレータ。"""
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

# 最初の10項を出力
for i, val in enumerate(fibonacci(10)):
    print(f"F({i}) = {val}")
```

## Rust

```rust
fn fibonacci(n: u64) -> u64 {
    match n {
        0 => 0,
        1 => 1,
        _ => {
            let (mut a, mut b) = (0u64, 1u64);
            for _ in 2..=n {
                (a, b) = (b, a + b);
            }
            b
        }
    }
}

fn main() {
    for i in 0..10 {
        println!("F({}) = {}", i, fibonacci(i));
    }
}
```

## Shell / Bash

```bash
#!/bin/bash
set -euo pipefail

TOOL=${1:-pandoc}
OUTPUT_DIR="outputs/${TOOL}"
mkdir -p "${OUTPUT_DIR}"

for f in samples/*.md; do
    base=$(basename "$f" .md)
    echo "Converting: ${base}"
    pandoc "$f" -o "${OUTPUT_DIR}/${base}.pdf" --pdf-engine=xelatex
done

echo "Done! PDFs saved to ${OUTPUT_DIR}/"
```

## JavaScript / TypeScript

```typescript
interface ConvertOptions {
  inputFile: string;
  outputDir: string;
  engine: "xelatex" | "typst" | "weasyprint";
}

async function convertMarkdownToPdf(opts: ConvertOptions): Promise<void> {
  const { inputFile, outputDir, engine } = opts;
  const outputFile = path.join(outputDir, path.basename(inputFile, ".md") + ".pdf");

  await execa("pandoc", [
    inputFile,
    "-o", outputFile,
    `--pdf-engine=${engine}`,
    "--toc",
  ]);
  console.log(`✓ ${path.basename(inputFile)} → ${path.basename(outputFile)}`);
}
```

## SQL

```sql
-- ツール比較テーブル
CREATE TABLE tools (
    id          INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    approach    TEXT    NOT NULL,
    cjk_support BOOLEAN DEFAULT FALSE,
    math        BOOLEAN DEFAULT FALSE,
    setup_ease  INTEGER CHECK (setup_ease BETWEEN 1 AND 5)
);

SELECT
    name,
    approach,
    CASE WHEN cjk_support THEN '○' ELSE '×' END AS cjk,
    setup_ease
FROM tools
ORDER BY setup_ease DESC;
```

## インラインコードと長い行

インライン: `docker compose run pandoc-xelatex` で変換を実行します。

長い行のテスト（折り返し確認）：

```
この行は意図的に非常に長くしています。ツールによってはコードブロック内の長い行が画面外にはみ出したり、適切に折り返されたりと、挙動が異なります。PDF出力時の挙動を確認してください。[long line test: abcdefghijklmnopqrstuvwxyz 0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ]
```
