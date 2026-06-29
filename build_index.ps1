# Script para corrigir o index.html e inserir a Seção 3 com scanner
$backupLines = Get-Content "index_backup_2025_11_25.html"
$section3Lines = Get-Content "secao3_scanner.html"

# Criar novo arquivo
$newFile = @()

# Adicionar linhas até o final da Seção 2 (linha 92 - antes do </div> incorreto)
for ($i = 0; $i -lt 92; $i++) {
    $newFile += $backupLines[$i]
}

# Adicionar o fechamento correto da Seção 2
$newFile += "                <div class=`"feature-card reveal`">"
$newFile += "                    <i data-lucide=`"printer`" class=`"icon-gold`"></i>"
$newFile += "                    <p>Materiais prontos para serem impressos</p>"
$newFile += "                </div>"
$newFile += "            </div>"
$newFile += "        </div>"
$newFile += "    </section>"
$newFile += ""

# Adicionar a Seção 3 completa com scanner
$newFile += $section3Lines

# Adicionar linha em branco
$newFile += ""

# Adicionar o resto do arquivo a partir da Seção 4 (linha 125 do backup corrompido)
# Mas primeiro preciso encontrar onde começa "<!-- SEÇÃO 4"
$section4Start = 0
for ($i = 93; $i -lt $backupLines.Count; $i++) {
    if ($backupLines[$i] -match "BÔNUS EXCLUSIVOS") {
        $section4Start = $i - 1  # Pegar a linha do comentário
        break
    }
}

if ($section4Start -gt 0) {
    for ($i = $section4Start; $i -lt $backupLines.Count; $i++) {
        $newFile += $backupLines[$i]
    }
}

# Salvar o novo arquivo
$newFile | Out-File -FilePath "index.html" -Encoding UTF8

Write-Host "Arquivo index.html criado com sucesso com a Seção 3 do scanner!"
