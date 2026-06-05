---
marp: true
title: Marp スライドデモ
theme: default
paginate: true
lang: ja
---

# Marp スライドデモ

**md-to-PDF ツール比較**

2026-06-05

---

# Marp とは

- **Marp** = Markdown Presentation Ecosystem
- Markdown でスライドを作成できる
- Chromium ベースの高品質 PDF 出力
- CSS テーマで自由にスタイリング

---

# コードも綺麗に表示

```python
def hello(name: str) -> str:
    return f"こんにちは、{name}さん！"

print(hello("世界"))
```

出力: `こんにちは、世界さん！`

---

# 表の例

| ツール | 形式 | CJK |
|--------|------|:---:|
| Pandoc + XeLaTeX | ドキュメント | ○ |
| Marp | スライド | ○ |
| md-to-pdf | ドキュメント | ○ |

---

# 数式

インライン: $E = mc^2$

ディスプレイ:

$$\sum_{n=1}^{\infty} \frac{1}{n^2} = \frac{\pi^2}{6}$$

---

# 画像

![w:300](../samples/assets/sample.png)

*図: テスト画像（PNG）*

---

# まとめ

1. Marp はプレゼンテーション用途に最適
2. 日本語（CJK）も適切に描画
3. `---` でスライドを区切る
4. テーマで見た目を自在にカスタマイズ

---

# ありがとうございました

> スライドは `marp --pdf slide-demo.md` で PDF 化
