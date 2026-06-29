# Script para inserir a Seção 3 com scanner no index.html
$backupFile = "index_backup_2025_11_25.html"
$section3File = "secao3_scanner.html"
$outputFile = "index.html"

# Ler o conteúdo dos arquivos
$backupContent = Get-Content $backupFile -Raw -Encoding UTF8
$section3Content = Get-Content $section3File -Raw -Encoding UTF8

# Encontrar o padrão da Seção 3 antiga e substituir pela nova
$pattern = '(?s)    <!-- SEÇÃO 3: POR QUE ESCOLHER -->.*?    </section>\r?\n\r?\n    <!-- SEÇÃO 4: BÔNUS EXCLUSIVOS -->'
$replacement = $section3Content + "`r`n`r`n    <!-- SEÇÃO 4: BÔNUS EXCLUSIVOS -->"

# Fazer a substituição
$newContent = $backupContent -replace $pattern, $replacement

# Salvar o arquivo
$newContent | Out-File -FilePath $outputFile -Encoding UTF8 -NoNewline

Write-Host "Seção 3 com scanner inserida com sucesso!"
