$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$dest = "c:\Users\teste\Desktop\p.v  facas\backup_$timestamp"
# Create backup directory
New-Item -ItemType Directory -Path $dest -Force | Out-Null
# Copy all files except previous backups
Copy-Item -Path "c:\Users\teste\Desktop\p.v  facas\*" -Destination $dest -Recurse -Force -Exclude "backup_*"
Write-Host "Backup created at $dest"
