# Windows でも POSIX レシピを動かすために bash を使う（Git for Windows 同梱）
set windows-shell := ["bash", "-uc"]

# `just` 単体実行時はレシピ一覧を表示
default:
    @just --list

# 全 Docker イメージをビルド
build:
    docker compose build

# 全ツールで変換
all: pandoc-xelatex pandoc-typst pandoc-weasyprint md-to-pdf marp quarto

# 各ツール単体実行
pandoc-xelatex:    (_run "pandoc-xelatex")
pandoc-typst:      (_run "pandoc-typst")
pandoc-weasyprint: (_run "pandoc-weasyprint")
md-to-pdf:         (_run "md-to-pdf")
marp:              (_run "marp")
quarto:            (_run "quarto")

[private]
_run TOOL:
    @echo "=== {{TOOL}} ==="
    docker compose run --rm {{TOOL}}

# 生成 PDF を削除
[confirm]
clean:
    rm -rf outputs/

# 出力 PDF のサイズ一覧
sizes:
    @find outputs -name "*.pdf" -exec ls -lh {} \; | awk '{print $5, $9}' | sort -k2
