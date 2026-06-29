# Script para adicionar scanner-styles.css ao index.html

$htmlFile = "index.html"
$content = Get-Content $htmlFile -Raw

# Adicionar a referência ao scanner-styles.css após styles.css
$content = $content -replace '(<link rel="stylesheet" href="styles.css">)', '$1`r`n    <link rel="stylesheet" href="scanner-styles.css">'

# Salvar o arquivo
Set-Content -Path $htmlFile -Value $content -NoNewline

Write-Host "scanner-styles.css adicionado ao index.html com sucesso!" -ForegroundColor Green
