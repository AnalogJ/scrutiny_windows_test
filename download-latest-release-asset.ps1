# Download latest dotnet/codeformatter release from github

$repo = "analogj/scrutiny_windows_test"
$file = $args[0]

$releases = "https://api.github.com/repos/$repo/releases"

Write-Host Determining latest release
$tag = (Invoke-WebRequest $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name

$download = "https://github.com/$repo/releases/download/$tag/$file"


New-Item -Path '/opt/scrutiny/bin/' -ItemType Directory

Write-Host Dowloading latest release
Invoke-WebRequest $download -UseBasicParsing -Out "/opt/scrutiny/bin/$file"