# ============================
#  Catify Everything Utility
#  by x1n3mot3 (me)
# ============================

Write-Host "Initializing Catify Engine..." -ForegroundColor Cyan
Start-Sleep -Milliseconds 500

# --- Cat Name Pool ---
$CatNames = "Chester","Mittens","ByteCat","ShadowPaw","KernelKitty","WhiskerDrive"

# --- Get Files in Current Folder ---
$Files = Get-ChildItem -File

if ($Files.Count -eq 0) {
    Write-Host "No files found. The cats are bored." -ForegroundColor DarkYellow
} else {
    Write-Host "Catifying $($Files.Count) files..." -ForegroundColor Magenta
}

foreach ($f in $Files) {
    $NewName = "$($CatNames | Get-Random)_$(Get-Random -Minimum 100 -Maximum 999)$($f.Extension)"
    Write-Host "[CATIFY] Renaming $($f.Name) → $NewName" -ForegroundColor Magenta
    Rename-Item $f.FullName $NewName

    # Add Cat Signature to text-like files
    if ($f.Extension -in ".txt",".log",".cfg",".ini") {
        Add-Content $NewName "`n# Cat Signature: $(Get-Random -Minimum 100000 -Maximum 999999)"
    }
}

Write-Host "`nCatification complete. Your system is now 87% more feline." -ForegroundColor Green

# ============================
#  Meow Song Player
# ============================

$Desktop = [Environment]::GetFolderPath("Desktop")
$MeowPath = Join-Path $Desktop "meow-song.mp3"

Write-Host "`nChecking for meow-song.mp3..." -ForegroundColor Cyan

if (Test-Path $MeowPath) {
    Write-Host "[AUDIO] Playing meow-song.mp3..." -ForegroundColor Yellow

    $Player = New-Object -ComObject WMPlayer.OCX
    $Player.URL = $MeowPath
    $Player.controls.play()

} else {
    Write-Host "[AUDIO ERROR] meow-song.mp3 not found on Desktop!" -ForegroundColor Red
    Write-Host "Place the file on your Desktop and run again."
}
