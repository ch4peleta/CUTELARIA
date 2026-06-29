# Ler arquivos como bytes para evitar problemas de codificação
$backup = [System.IO.File]::ReadAllLines("index_backup_2025_11_25.html", [System.Text.Encoding]::UTF8)
$section3 = [System.IO.File]::ReadAllLines("secao3_scanner.html", [System.Text.Encoding]::UTF8)

# Criar array para o novo arquivo
$newContent = @()

# Adicionar linhas 0-91 (até o final dos feature cards)
for ($i = 0; $i -le 91; $i++) {
    $newContent += $backup[$i]
}

# Adicionar o último feature card que está faltando
$newContent += "                <div class=`"feature-card reveal`">"
$newContent += "                    <i data-lucide=`"printer`" class=`"icon-gold`"></i>"
$newContent += "                    <p>Materiais prontos para serem impressos</p>"
$newContent += "                </div>"
$newContent += "            </div>"
$newContent += "        </div>"
$newContent += "    </section>"
$newContent += ""

# Adicionar toda a Seção 3
foreach ($line in $section3) {
    $newContent += $line
}
$newContent += ""

# Encontrar onde começa a Seção 4 e adicionar o resto
$foundSection4 = $false
for ($i = 92; $i -lt $backup.Count; $i++) {
    if ($backup[$i] -like "*BONUS*" -or $backup[$i] -like "*Bonus*") {
        # Voltar 1 linha para pegar o comentário
        if ($i -gt 0 -and $backup[$i-1] -like "*<!--*") {
            $newContent += $backup[$i-1]
            $foundSection4 = $true
        }
        for ($j = $i; $j -lt $backup.Count; $j++) {
            $newContent += $backup[$j]
        }
        break
    }
}

# Salvar
[System.IO.File]::WriteAllLines("index.html", $newContent, [System.Text.Encoding]::UTF8)
Write-Host "OK - Arquivo criado"
