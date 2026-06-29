$htmlPath = "c:\Users\teste\Desktop\p.v  facas\index.html"
$content = Get-Content $htmlPath -Raw -Encoding UTF8

# Trocar texto do botão Básico
$content = $content -replace '>COMPRAR\s+AGORA</a>', '>COMEÇAR COM O BÁSICO</a>'

# Trocar texto do botão Premium
$content = $content -replace '>QUERO ACESSO\s+VITALÍCIO</a>', '>GARANTIR O PREMIUM</a>'

[System.IO.File]::WriteAllText($htmlPath, $content, [System.Text.Encoding]::UTF8)

Write-Host "Botões atualizados com sucesso!" -ForegroundColor Green
