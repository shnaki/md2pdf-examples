# Windows ではホストの PowerShell を使用（WSL/Git Bash 不要）
set windows-shell := ["powershell.exe", "-NoProfile", "-Command"]

# `just` 単体実行時はレシピ一覧を表示
default:
    @just --list

# ベースイメージを事前取得
pull:
    docker compose pull --ignore-buildable

# 全 Docker イメージをビルド（docker compose build は Bake でエラーが隠れるため docker build を直接使用）
build:
    docker build tools/pandoc-xelatex    -t md2pdf-examples-pandoc-xelatex    --progress=plain
    docker build tools/pandoc-typst      -t md2pdf-examples-pandoc-typst      --progress=plain
    docker build tools/pandoc-weasyprint -t md2pdf-examples-pandoc-weasyprint --progress=plain
    docker build tools/md-to-pdf         -t md2pdf-examples-md-to-pdf         --progress=plain
    docker build tools/marp              -t md2pdf-examples-marp               --progress=plain
    docker build tools/quarto            -t md2pdf-examples-quarto             --progress=plain

# キャッシュを無視して全イメージを強制再ビルド。
# Docker Desktop on Windows では Dockerfile の変更が `build` で反映されない場合がある（BuildKit の
# キャッシュ判定バグ）。その際はこのレシピを使う。
rebuild:
    docker build --no-cache tools/pandoc-xelatex    -t md2pdf-examples-pandoc-xelatex    --progress=plain
    docker build --no-cache tools/pandoc-typst      -t md2pdf-examples-pandoc-typst      --progress=plain
    docker build --no-cache tools/pandoc-weasyprint -t md2pdf-examples-pandoc-weasyprint --progress=plain
    docker build --no-cache tools/md-to-pdf         -t md2pdf-examples-md-to-pdf         --progress=plain
    docker build --no-cache tools/marp              -t md2pdf-examples-marp               --progress=plain
    docker build --no-cache tools/quarto            -t md2pdf-examples-quarto             --progress=plain

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
[unix, confirm]
clean:
    rm -rf outputs/

[windows, confirm]
clean:
    if (Test-Path outputs) { Remove-Item -Recurse -Force outputs }

# 出力 PDF のサイズ一覧
[unix]
sizes:
    @find outputs -name "*.pdf" -exec ls -lh {} \; | awk '{print $5, $9}' | sort -k2

[windows]
sizes:
    @Get-ChildItem -Recurse outputs -Filter '*.pdf' | ForEach-Object { '{0,8:N1} KB  {1}' -f ($_.Length / 1KB), $_.FullName }
