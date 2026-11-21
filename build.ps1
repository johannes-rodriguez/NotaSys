param([string]$Jdk = $env:JAVA_HOME, [switch]$Package)
$ErrorActionPreference = 'Stop'
if (-not $Jdk) {
    $compiler = Get-Command javac -ErrorAction Stop
    $Jdk = Split-Path (Split-Path $compiler.Source -Parent) -Parent
}
$compilerPath = Join-Path $Jdk 'bin\javac.exe'
if (-not (Test-Path -LiteralPath $compilerPath)) { throw 'Indica la carpeta de un JDK 17 o superior con -Jdk.' }
$classesPath = Join-Path $PSScriptRoot 'build\classes'
$jarPath = Join-Path $PSScriptRoot 'build\jar'
New-Item -ItemType Directory -Path $classesPath,$jarPath -Force | Out-Null
$sources = Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'src') -Recurse -Filter '*.java' | Select-Object -ExpandProperty FullName
& $compilerPath -encoding UTF-8 --release 17 -d $classesPath $sources
if ($LASTEXITCODE -ne 0) { throw 'Falló la compilación.' }
Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'db') -Destination $classesPath -Recurse -Force
& (Join-Path $Jdk 'bin\jar.exe') --create --file (Join-Path $jarPath 'notasys.jar') --main-class App -C $classesPath .
if ($LASTEXITCODE -ne 0) { throw 'No se pudo generar el JAR.' }
$dependencyPath = Join-Path $PSScriptRoot 'lib'
if (-not (Test-Path (Join-Path $dependencyPath 'postgresql'))) {
    $dependencyPath = Join-Path $PSScriptRoot 'EJECUTABLE\app'
}
Copy-Item -LiteralPath (Join-Path $dependencyPath 'pgsql') -Destination $jarPath -Recurse -Force
Copy-Item -LiteralPath (Join-Path $dependencyPath 'postgresql') -Destination $jarPath -Recurse -Force
Write-Host 'Compilado: build\jar\notasys.jar'
if ($Package) {
    $distPath = Join-Path $PSScriptRoot 'dist'
    New-Item -ItemType Directory -Path $distPath -Force | Out-Null
    if (Test-Path -LiteralPath (Join-Path $distPath 'NotaSys')) {
        throw 'Ya existe dist\NotaSys. Conserva o renombra esa carpeta antes de crear otro paquete.'
    }
    $packageStage = Join-Path ([System.IO.Path]::GetTempPath()) ('notasys-build-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $packageStage -Force | Out-Null
    & (Join-Path $Jdk 'bin\jpackage.exe') --type app-image --input $jarPath --main-jar notasys.jar --name NotaSys --app-version 1.0.0 --vendor 'NotaSys' --description 'Gestión de notas y comprobantes' --dest $packageStage --add-modules java.desktop,java.sql,java.xml --java-options '-Dfile.encoding=UTF-8'
    if ($LASTEXITCODE -ne 0) { throw 'Falló el empaquetado.' }
    Copy-Item -LiteralPath (Join-Path $packageStage 'NotaSys') -Destination $distPath -Recurse
    Write-Host 'Listo: dist\NotaSys\NotaSys.exe (conservar toda la carpeta).'
}
