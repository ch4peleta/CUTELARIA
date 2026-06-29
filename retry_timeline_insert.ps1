$htmlPath = "c:\Users\teste\Desktop\p.v  facas\index.html"
$timelineHtmlPath = "c:\Users\teste\Desktop\p.v  facas\timeline_content.html"

$htmlContent = Get-Content $htmlPath -Raw -Encoding UTF8
$timelineHtml = Get-Content $timelineHtmlPath -Raw -Encoding UTF8

# Regex pattern to find the insertion point
# We look for the paragraph text, the closing div of the item, and the closing div of the list
$pattern = '(<p>Suporte técnico para tirar todas as suas dúvidas</p>\s*</div>\s*</div>)'

if ($htmlContent -match $pattern) {
    # Insert the timeline HTML after the matched group
    $htmlContent = $htmlContent -replace $pattern, ('$1' + "`n" + $timelineHtml)
    [System.IO.File]::WriteAllText($htmlPath, $htmlContent, [System.Text.Encoding]::UTF8)
    Write-Host "Timeline HTML inserido com sucesso (Regex)." -ForegroundColor Green
} else {
    Write-Host "ERRO: Ponto de inserção da Timeline não encontrado (Regex)!" -ForegroundColor Red
    # Debug: Print a snippet to see what's going on
    $snippet = $htmlContent | Select-String "Suporte técnico" -Context 0, 5
    Write-Host "Snippet encontrado:"
    Write-Host $snippet
}
