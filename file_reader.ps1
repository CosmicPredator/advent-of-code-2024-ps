
# Reads the content from file and return the string.
function Read-File {
    param (
        [string]$FileName
    )
    $fileContent = Get-Content -Path $FileName
    return $fileContent
}