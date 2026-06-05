# Makefile の代替 — Windows で make が使えない場合に使用
param(
  [string[]]$Tools = @("pandoc-xelatex", "pandoc-typst", "pandoc-weasyprint", "md-to-pdf", "marp", "quarto"),
  [switch]$BuildFirst
)

if ($BuildFirst) {
  Write-Host "=== Building images ===" -ForegroundColor Cyan
  docker compose build
}

foreach ($tool in $Tools) {
  Write-Host "`n=== $tool ===" -ForegroundColor Cyan
  docker compose run --rm $tool
  if ($LASTEXITCODE -ne 0) {
    Write-Warning "$tool failed (exit code $LASTEXITCODE)"
  }
}

Write-Host "`n=== Done ===" -ForegroundColor Green
Get-ChildItem -Recurse outputs -Filter "*.pdf" | Select-Object FullName, Length |
  ForEach-Object { "$([math]::Round($_.Length/1KB, 1)) KB  $($_.FullName)" }
