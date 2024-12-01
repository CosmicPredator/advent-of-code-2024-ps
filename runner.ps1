. .\solutions\day_1.ps1


$global:numDaysCompleted = 1
$global:inputFilesDir = "input/"


function Greet {
    Write-Host "Welcome to Cosmic's AoC 2024 Solutions...!" -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host ""
    $global:sessionToken = Read-Host -Prompt "Enter your session token" -MaskInput
}

function CreateInputDir {
    if ((Test-Path -Path $global:inputFilesDir)) {
        Remove-Item -Recurse $global:inputFilesDir
    }
    New-Item -Path $global:inputFilesDir -ItemType Directory > $null
}


function DownloadInputs {
    for ($i = 0; $i -lt $numDaysCompleted; $i++) {
        $inputRequestUrl = "https://adventofcode.com/2024/day/$($i + 1)/input"
        $headers = @{
            "Cookie" = "session=$global:sessionToken"
        }
    
        $response = Invoke-WebRequest -Uri $inputRequestUrl `
                                      -Headers $headers `
                                      -Method Get
    
        Set-Content -Path "$inputFilesDir/day_$($i + 1).txt" `
                    -Value $response.Content.TrimEnd()
    }
}

class SolutionRunner {
    [PSCustomObject]$ResultsObj

    [void] RunSolutions() {
        $this.ResultsObj += ExecuteDay1
    }

    [void] InitRunner() {
        CreateInputDir
        Greet
        DownloadInputs
    }
}

$runner = New-Object SolutionRunner
$runner.InitRunner()
$runner.RunSolutions()

$runner.ResultsObj | Format-Table -AutoSize

Write-Host "Thanks..!" -ForegroundColor DarkMagenta