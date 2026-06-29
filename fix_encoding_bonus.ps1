$indexPath = "c:\Users\teste\Desktop\p.v  facas\index.html"
$content = Get-Content $indexPath -Raw

# Corrigir o encoding dos caracteres
$content = $content -replace 'vocÃª', 'você'
$content = $content -replace 'bÃ´nus', 'bônus'

# Remover os caracteres `r`n literais que foram inseridos incorretamente
$content = $content -replace '`r`n', "`r`n"

# Salvar o arquivo
[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)

Write-Host "Encoding corrigido!"
