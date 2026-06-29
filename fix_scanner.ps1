$cssPath = "c:\Users\teste\Desktop\p.v  facas\styles.css"
$content = Get-Content $cssPath -Raw -Encoding UTF8

# Corrigir scanner: tamanho, object-fit, remover filtro, opacidade
$content = $content -replace '(\.scanner-image\s*\{\s*position:\s*absolute;\s*top:\s*50%;\s*left:\s*50%;\s*transform:\s*translate\(-50%,\s*-50%\);\s*)width:\s*130%;', '$1width: 95%;'
$content = $content -replace '(\.scanner-image\s*\{[^\}]*width:\s*95%;[^\}]*)height:\s*130%;', '$1height: 95%;'
$content = $content -replace '(\.scanner-image\s*\{[^\}]*)object-fit:\s*cover;', '$1object-fit: contain;'
$content = $content -replace '(\.scanner-image\s*\{[^\}]*)filter:\s*grayscale\(100%\)\s*contrast\(1\.1\);\s*', '$1'
$content = $content -replace '(\.scanner-image\s*\{[^\}]*)opacity:\s*0\.6;', '$1opacity: 1;'

[System.IO.File]::WriteAllText($cssPath, $content, [System.Text.Encoding]::UTF8)

Write-Host "Scanner corrigido com sucesso!" -ForegroundColor Green
