param([string]$Jdk = $env:JAVA_HOME, [switch]$UI)
$ErrorActionPreference = 'Stop'
if (-not $Jdk) { $Jdk = Split-Path (Split-Path (Get-Command javac -ErrorAction Stop).Source -Parent) -Parent }
& (Join-Path $PSScriptRoot 'build.ps1') -Jdk $Jdk
if ($LASTEXITCODE -ne 0) { throw 'No se pudo compilar la aplicación.' }
$classes = Join-Path $PSScriptRoot 'build\classes'
$testClasses = Join-Path $PSScriptRoot 'build\tests'
New-Item -ItemType Directory -Path $testClasses -Force | Out-Null
$tests = Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'tests') -Filter '*.java' | Select-Object -ExpandProperty FullName
& (Join-Path $Jdk 'bin\javac.exe') -encoding UTF-8 --release 17 -cp $classes -d $testClasses $tests
if ($LASTEXITCODE -ne 0) { throw 'Falló la compilación de pruebas.' }
& (Join-Path $Jdk 'bin\java.exe') -ea "-Dnotasys.root=$PSScriptRoot" -cp "$classes;$testClasses" ModelTest
if ($LASTEXITCODE -ne 0) { throw 'Fallaron las pruebas del modelo.' }
if ($UI) {
    & (Join-Path $Jdk 'bin\java.exe') -ea "-Dnotasys.root=$PSScriptRoot" -cp "$classes;$testClasses" UiTest (Join-Path $PSScriptRoot 'build\preview')
    if ($LASTEXITCODE -ne 0) { throw 'Fallaron las pruebas de interfaz.' }
}
