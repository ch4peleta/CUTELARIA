$cssPath = "c:\Users\teste\Desktop\p.v  facas\styles.css"
$htmlPath = "c:\Users\teste\Desktop\p.v  facas\index.html"
$timelineCssPath = "c:\Users\teste\Desktop\p.v  facas\timeline_styles.css"
$timelineHtmlPath = "c:\Users\teste\Desktop\p.v  facas\timeline_content.html"

# 1. Append Timeline CSS
$timelineCss = Get-Content $timelineCssPath -Raw -Encoding UTF8
Add-Content -Path $cssPath -Value "`n$timelineCss" -Encoding UTF8
Write-Host "CSS da Timeline adicionado." -ForegroundColor Green

# 2. Adjust Bonus Book Spacing (150px -> 90px)
$cssContent = Get-Content $cssPath -Raw -Encoding UTF8
$cssContent = $cssContent -replace 'margin: 0 auto 150px;', 'margin: 0 auto 90px;'
[System.IO.File]::WriteAllText($cssPath, $cssContent, [System.Text.Encoding]::UTF8)
Write-Host "Espaçamento dos livros ajustado para 90px." -ForegroundColor Green

# 3. Insert Timeline HTML
$htmlContent = Get-Content $htmlPath -Raw -Encoding UTF8
$timelineHtml = Get-Content $timelineHtmlPath -Raw -Encoding UTF8

# Target insertion point: After the last benefit item and closing div of the grid
# We look for the specific closing tags sequence
$targetString = '                <div class="benefit-item reveal hover-animate">
                    <i data-lucide="headphones" class="icon-gold"></i>
                    <p>Suporte técnico para tirar todas as suas dúvidas</p>
                </div>
            </div>'

$replacementString = $targetString + "`n" + $timelineHtml

if ($htmlContent -match [regex]::Escape($targetString)) {
    $htmlContent = $htmlContent.Replace($targetString, $replacementString)
    Write-Host "Timeline HTML inserido com sucesso." -ForegroundColor Green
} else {
    Write-Host "ERRO: Ponto de inserção da Timeline não encontrado!" -ForegroundColor Red
}

# 4. Update Button Texts
$htmlContent = $htmlContent -replace '>COMEÇAR COM O BÁSICO</a>', '>QUERO O BÁSICO</a>'
# Ensure Premium button is correct (it might already be, but ensuring consistency)
$htmlContent = $htmlContent -replace '>GARANTIR O PREMIUM</a>', '>GARANTIR O PREMIUM</a>'

[System.IO.File]::WriteAllText($htmlPath, $htmlContent, [System.Text.Encoding]::UTF8)
Write-Host "Textos dos botões atualizados." -ForegroundColor Green
