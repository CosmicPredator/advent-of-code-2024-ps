. .\helper.ps1

function Day1Part1 {
    param (
        [PSCustomObject]$InputString
    )

    $leftList = @()
    $rightList = @()

    # Parse the input and inflate to the lists
    foreach ($inputItem in $InputString) {
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
    return $accum
}

function Day1Part2 {
    param (
        [PSCustomObject]$InputString
    )

    # Initialize two empty list for right and left elements
    $leftList = @()
    $rightList = @()

    # Parse the input and inflate to the lists
    foreach ($inputItem in $InputString) {
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

    return $accum
}

# The scoped runner
function ExecuteDay1 {
    # Reads file contents as string
    # Refer file_reader.ps1
    $day1Input = Read-File -FileName ./input/day_1.txt

    $timer = New-Object ExecutionTimer
    $result = @()

    $timer.Start()
    $sol1 = Day1Part1 -InputString $day1Input
    $timer.Stop()

    $result += [SolutionObject]::new("Day 1 Part 1", $sol1, "$($timer.GetExecutionTime())")

    $timer.Start()
    $sol2 = Day1Part2 -InputString $day1Input
    $timer.Stop()

    $result += [SolutionObject]::new("Day 1 Part 2", $sol2, "$($timer.GetExecutionTime())")

    return $result
}