# Fix Encoding Script
$file = "c:\Users\teste\Desktop\p.v  facas\index.html"

# Ler arquivo
$bytes = [System.IO.File]::ReadAllBytes($file)
$content = [System.Text.Encoding]::UTF8.GetString($bytes)

# Correções específicas
$content = $content -replace 'Ã§', 'ç'
$content = $content -replace 'Ã£', 'ã'
$content = $content -replace 'Ã©', 'é'
$content = $content -replace 'Ãº', 'ú'
$content = $content -replace 'Ã­', 'í'
$content = $content -replace 'Ã³', 'ó'
$content = $content -replace 'Ã¡', 'á'
$content = $content -replace 'Ãµ', 'õ'
$content = $content -replace 'Ã¢', 'â'
$content = $content -replace 'Ãª', 'ê'
$content = $content -replace 'Ã´', 'ô'
$content = $content -replace '\?\?', 'ã'

# Salvar com UTF-8 BOM
$utf8BOM = New-Object System.Text.UTF8Encoding $true
[System.IO.File]::WriteAllText($file, $content, $utf8BOM)

Write-Host "✅ Encoding corrigido!" -ForegroundColor Green
