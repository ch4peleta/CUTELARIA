$cssPath = "c:\Users\teste\Desktop\p.v  facas\styles.css"
$content = Get-Content $cssPath -Raw -Encoding UTF8

# Encontrar e substituir APENAS a linha 393 específica do .bonus-book-container
$content = $content -replace '(\.bonus-book-container\s*\{\s*width:\s*200px;\s*height:\s*300px;\s*)margin:\s*0\s+auto;', '$1margin: 0 auto 150px;'

# Salvar o arquivo
[System.IO.File]::WriteAllText($cssPath, $content, [System.Text.Encoding]::UTF8)

Write-Host "Espaçamento dos livros aumentado para 150px com sucesso!" -ForegroundColor Green
