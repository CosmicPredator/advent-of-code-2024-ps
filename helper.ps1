
# Reads the content from file and return the string.
function Read-File {
    param (
        [string]$FileName
    )
    $fileContent = Get-Content -Path $FileName
    return $fileContent
}

# Execution time recording helpers
class ExecutionTimer {
    [datetime]$StartTime
    [datetime]$EndTime

    [void] Start() {
        $this.StartTime = Get-Date
    }

    [void] Stop() {
        $this.EndTime = Get-Date
    }

    [string] GetExecutionTime() {
        $elapsed = $this.EndTime - $this.StartTime
        return "$($elapsed.TotalMilliseconds)ms"
    }
}

# Custom object to store solutions and tabulate data
class SolutionObject {
    [string]$ProblemName
    [long]$Solution
    [string]$ExecutionTime

    SolutionObject([string]$problemName, [long]$solution, [string]$executionTime) {
        $this.ProblemName = $problemName
        $this.Solution = $solution
        $this.ExecutionTime = $executionTime
    }
}