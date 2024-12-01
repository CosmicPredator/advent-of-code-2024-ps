. .\helper.ps1

function Part1 {

    # Reads file contents as string
    # Refer file_reader.ps1
    $inputString = Read-File -FileName ./input/day_1.txt

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
    return $accum
}

function Part2 {

    # Reads file contents as string
    # Refer file_reader.ps1
    $inputString = Read-File -FileName ./input/day_1.txt

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

    return $accum
}

# The scoped runner
function ExecuteDay1 {
    $timer = New-Object ExecutionTimer
    $result = @()

    $timer.Start()
    $sol1 = Part1
    $timer.Stop()

    $result += [SolutionObject]::new("Day 1 Part 1", $sol1, "$($timer.GetExecutionTime())")

    $timer.Start()
    $sol2 = Part2
    $timer.Stop()

    $result += [SolutionObject]::new("Day 1 Part 2", $sol2, "$($timer.GetExecutionTime())")

    return $result
}