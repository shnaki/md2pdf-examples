---
title: リッチ要素のサンプル
lang: ja
toc: true
---

# 表・脚注・引用・TOC

## 表

### ツール比較表（プレースホルダー）

| ツール | アプローチ | CJK | 数式 | コード | セットアップ |
|--------|-----------|:---:|:----:|:------:|:----------:|
| Pandoc + XeLaTeX | LaTeX 組版 | ○ | ○ | ○ | 難 |
| Pandoc + Typst | Typst 組版 | ○ | ○ | ○ | 中 |
| Pandoc + WeasyPrint | CSS Paged Media | △ | △ | ○ | 中 |
| md-to-pdf | Chrome/Puppeteer | ○ | ○ | ○ | 易 |
| Marp CLI | スライド + Chrome | ○ | ○ | ○ | 易 |
| Quarto | Pandoc ラッパ | ○ | ○ | ○ | 中 |

### 小さいテーブル（左揃え）

| キー | 値 |
|------|----|
| 言語 | 日本語 |
| 日付 | 2026-06-05 |
| バージョン | 1.0.0 |

## 脚注

Markdown[^md] は John Gruber[^gruber] が 2004 年に開発したマークアップ言語です。

GitHub Flavored Markdown (GFM)[^gfm] は GitHub が拡張した仕様で、表やタスクリストなどが追加されています。

[^md]: Markdown の仕様は <https://spec.commonmark.org> で確認できます。
[^gruber]: John Gruber は Daring Fireball というブログでも知られています。
[^gfm]: GFM 仕様: <https://github.github.com/gfm/>

## 引用のネスト

> これは通常の引用です。
>
> > これはネストされた引用です。
> >
> > さらに深いレベルも可能です。
>
> 引用を戻りました。

## 定義リスト（Pandoc 拡張）

Pandoc
:   汎用ドキュメント変換ツール。多数の形式を相互変換できる。

Typst
:   新世代の組版システム。LaTeX の代替として注目されている。

WeasyPrint
:   Python 製の HTML/CSS to PDF 変換ライブラリ。CSS Paged Media をサポート。

## 絵文字

Markdown ファイルに絵文字を含めた場合のレンダリングテスト：

- 🎉 お祝い
- 📄 ドキュメント
- ✅ チェック済み
- ⚠️ 警告
- 🔗 リンク
- 💡 アイデア

## 打ち消し線・下付き・上付き

~~打ち消し線~~ を使えます（GFM 拡張）。

H~2~O（下付き） と x^2^（上付き）は Pandoc 拡張で使えます。

## 水平線と区切り

---

## まとめ

このサンプルファイルでは以下を確認できます：

1. **表** — セル配置と幅の調整
2. **脚注** — ページ下部への自動配置
3. **引用** — ネスト構造の描画
4. **定義リスト** — Pandoc 独自拡張
5. **絵文字** — Unicode 文字の描画
6. **打ち消し線** — GFM 拡張書式
