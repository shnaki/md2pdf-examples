# Markdown → PDF 変換ツール比較

同一の Markdown ファイルを 6 つの異なるツールで PDF 変換し、品質・機能・セットアップを比較するプロジェクト。

## 比較対象ツール

| # | サービス名 | アプローチ | ベース |
|---|------------|-----------|--------|
| 1 | `pandoc-xelatex` | LaTeX 組版 | pandoc/extra + XeLaTeX |
| 2 | `pandoc-typst` | Typst 組版 | pandoc/extra + Typst |
| 3 | `pandoc-weasyprint` | CSS Paged Media | pandoc/core + WeasyPrint |
| 4 | `md-to-pdf` | Headless Chrome | node:20 + Chromium |
| 5 | `marp` | スライド + Chrome | marpteam/marp-cli |
| 6 | `quarto` | Pandoc ラッパ | ghcr.io/quarto-dev/quarto |

## クイックスタート

> **前提**: [just](https://github.com/casey/just) が必要です。`winget install Casey.Just` / `brew install just` / `cargo install just` でインストールしてください。

```bash
# レシピ一覧を表示
just

# 全イメージをビルド（初回のみ、数分かかります）
just build

# 全ツールで変換を実行
just all

# 個別実行
just pandoc-xelatex
just md-to-pdf

# 出力を確認
ls outputs/*/

# クリーン（確認プロンプトあり）
just clean
```

## ディレクトリ構成

```
.
├── samples/                  # 変換元 Markdown（全ツール共通）
│   ├── 01-basic.md           # 見出し・段落・リスト・リンク（CJK 混在）
│   ├── 02-code.md            # コードブロック（多言語・長い行）
│   ├── 03-math.md            # 数式（インライン・ディスプレイ・行列）
│   ├── 04-rich.md            # 表・脚注・引用・TOC・絵文字
│   ├── 05-images.md          # 画像（SVG・PNG・サイズ指定）
│   └── assets/               # テスト画像
├── samples-marp/             # Marp 専用スライド形式サンプル
│   └── slide-demo.md
├── tools/                    # 各ツールの Dockerfile + スクリプト
│   ├── pandoc-xelatex/
│   ├── pandoc-typst/
│   ├── pandoc-weasyprint/
│   ├── md-to-pdf/
│   ├── marp/
│   └── quarto/
├── outputs/                  # 生成された PDF（git 管理外）
│   └── <tool>/<sample>.pdf
├── docker-compose.yml
└── justfile
```

## 比較結果

> 実行後に各 PDF を目視確認し、以下の表を更新してください。

### 機能対応マトリクス

| ツール | CJK | コード | 数式 | 表 | 画像 | TOC | 脚注 |
|--------|:---:|:------:|:----:|:--:|:----:|:---:|:----:|
| pandoc-xelatex | | | | | | | |
| pandoc-typst | | | | | | | |
| pandoc-weasyprint | | | | | | | |
| md-to-pdf | | | | | | | |
| marp | | | | | | | |
| quarto | | | | | | | |

凡例: ○ = 良好　△ = 部分対応/要設定　× = 非対応/崩れ

### 総合評価

| ツール | セットアップ | 変換速度 | 出力品質 | カスタマイズ | 用途 |
|--------|:----------:|:------:|:------:|:---------:|------|
| pandoc-xelatex | 難 | 遅 | | 高 | 論文・技術書 |
| pandoc-typst | 中 | 速 | | 中 | 一般文書 |
| pandoc-weasyprint | 中 | 中 | | 中（CSS） | Web 移植 |
| md-to-pdf | 易 | 中 | | 中（CSS） | 手軽な変換 |
| marp | 易 | 速 | | 中（テーマ） | プレゼン |
| quarto | 中 | 遅 | | 高 | 科学・データ |

## メモ

- **Marp** はスライド特化なので `samples-marp/slide-demo.md` を使用（`---` でスライド区切り）
- **XeLaTeX** ビルドは TeX Live のため初回に数分かかる
- **WeasyPrint** は Google Fonts API を CSS でインポートしているためオフライン環境では別途フォント設定が必要
- **Typst** バイナリは Dockerfile 内で GitHub Releases からダウンロード（バージョンは `ARG TYPST_VERSION` で固定）
- SVG 画像は XeLaTeX では `rsvg-convert` で PDF 変換してから取り込む
