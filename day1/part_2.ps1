. ./file_reader.ps1

# Reads file contents as string
# Refer file_reader.ps1
$inputString = Read-File -FileName ./inputs/day_1_part_2.txt

# Start the execution time timer
$startTime = Get-Date

# Initialize two empty list for right and left elements
$leftList = @()
$rightList = @()

# Parse the input and inflate to the lists
foreach ($inputItem in $inputString) {
    $splitData = $inputItem -split "\s+"
    $leftList += [System.Convert]::ToInt32($splitData[0])
    $rightList += [System.Convert]::ToInt32($splitData[1])
}

# Create an Hash Table to map the elements with their 
# number of occurances
$countHashTable = @{}

foreach ($item in $rightList) {
    if ($countHashTable.ContainsKey(($item))) {
        $countHashTable[$item]++
    } else {
        $countHashTable[$item] = 1
    }
}

# Initialize an accumulator to store the final answer
$accum = 0

# Append the accumulator with the occurances
foreach ($item in $leftList) {
    if ($countHashTable.ContainsKey(($item))) {
        $accum += ($countHashTable[$item] * $item)
    }
}

# Stop the timer and get the difference
$endTime = Get-Date
$executionTime = $endTime - $startTime

# Print the finaly answer and time taken to Console
Write-Host "Solution: $accum" -ForegroundColor Cyan
Write-Host "Execution time: $($executionTime.TotalMilliseconds)ms" -ForegroundColor Green