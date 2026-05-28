# Kit de Optimización Total 2026: Limpiador de Windows
# Este script realiza una limpieza segura de archivos temporales y optimizaciones del sistema.
# Ejecutar como Administrador para mejores resultados.

Write-Host "--- Iniciando Limpieza de Windows 2026 ---" -ForegroundColor Cyan

# 1. Limpieza de Archivos Temporales de Usuario
Write-Host "Limpiando archivos temporales de usuario..." -ForegroundColor Yellow
$tempPath = $env:TEMP
Get-ChildItem -Path $tempPath -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

# 2. Limpieza de Archivos Temporales del Sistema
Write-Host "Limpiando archivos temporales del sistema..." -ForegroundColor Yellow
$systemTempPath = "C:\Windows\Temp"
Get-ChildItem -Path $systemTempPath -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

# 3. Limpieza de la Papelera de Reciclaje
Write-Host "Vaciando la papelera de reciclaje..." -ForegroundColor Yellow
Clear-RecycleBin -Confirm:$false -ErrorAction SilentlyContinue

# 4. Limpieza de Caché de DNS
Write-Host "Limpiando la caché de DNS..." -ForegroundColor Yellow
Clear-DnsClientCache

# 5. Optimización de Disco (Trim para SSD, Desfragmentación para HDD)
Write-Host "Optimizando unidades de disco..." -ForegroundColor Yellow
Optimize-Volume -DriveLetter C -ReTrim -ErrorAction SilentlyContinue

# 6. Limpieza de Prefetch (Opcional, puede ralentizar el primer inicio de apps)
# Write-Host "Limpiando Prefetch..." -ForegroundColor Yellow
# Get-ChildItem -Path "C:\Windows\Prefetch" -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue

Write-Host "--- Limpieza Completada con Éxito ---" -ForegroundColor Green
Write-Host "Recuerda reiniciar tu equipo para aplicar todos los cambios." -ForegroundColor Cyan
