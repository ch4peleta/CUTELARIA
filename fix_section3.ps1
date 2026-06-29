$backup = Get-Content "index_backup_2025_11_25.html" -Raw
$section3 = Get-Content "secao3_scanner.html" -Raw

# Encontrar e substituir a Seção 3
$start = $backup.IndexOf("    <!-- SEÇÃO 3")
$end = $backup.IndexOf("    <!-- SEÇÃO 4", $start)

if ($start -gt 0 -and $end -gt $start) {
    $before = $backup.Substring(0, $start)
    $after = $backup.Substring($end)
    $newContent = $before + $section3 + "`r`n`r`n" + $after
    
    [System.IO.File]::WriteAllText("index.html", $newContent, [System.Text.Encoding]::UTF8)
    Write-Host "OK"
} else {
    Write-Host "ERRO: Nao encontrou as secoes"
}
