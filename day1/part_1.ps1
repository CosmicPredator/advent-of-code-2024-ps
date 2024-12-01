. ./file_reader.ps1

# Reads file contents as string
# Refer file_reader.ps1
$inputString = Read-File -FileName ./inputs/day_1_part_1.txt

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

# Sort the list in Ascending order
$leftList = $leftList | Sort-Object
$rightList = $rightList | Sort-Object

# Initialize an accumulator to store the final answer
$accum = 0

# Compare the distance between smallest number and append
# the distance to accumulator
for ($i = 0; $i -lt $leftList.Count; $i++) {
    $difference = $leftList[$i] - $rightList[$i]
    $accum += ([System.Math]::Abs($difference))
}

# Stop the timer and get the difference
$endTime = Get-Date
$executionTime = $endTime - $startTime

# Print the finaly answer and time taken to Console
Write-Host "Solution: $accum" -ForegroundColor Cyan
Write-Host "Execution time: $($executionTime.TotalMilliseconds)ms" -ForegroundColor Green