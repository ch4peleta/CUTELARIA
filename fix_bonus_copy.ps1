$indexPath = "c:\Users\teste\Desktop\p.v  facas\index.html"
$content = Get-Content $indexPath -Raw -Encoding UTF8

# Substituir a linha da seção de bônus
$content = $content -replace '<section class="bonuses section-padding bg-darker">', '<section class="bonuses bonus-section-compact bg-darker">'

# Adicionar o h2 antes da grid-4
$content = $content -replace '(<section class="bonuses bonus-section-compact bg-darker">\s*<div class="container">)\s*(<div class="grid-4">)', '$1`r`n            <h2 class="bonus-intro-text">E comprando hoje, você recebe os seguintes bônus:</h2>`r`n            $2'

# Salvar o arquivo
Set-Content -Path $indexPath -Value $content -Encoding UTF8 -NoNewline

Write-Host "Alterações aplicadas com sucesso!"
