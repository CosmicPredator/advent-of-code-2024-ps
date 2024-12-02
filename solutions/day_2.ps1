. .\helper.ps1

function Compare-Lists {
    param (
        [int[]]$InputList,
        [int[]]$DiffList
    )
    for ($i = 0; $i -lt $InputList.Length; $i++) {
        if ($InputList[$i] -ne $DiffList[$i]) {
            return $false
        }
    }
    return $true
}

function Check-Progression {
    param (
        [int[]]$InputList
    )
    $sortedList = $InputList | Sort-Object
    $reverseSortedList = $InputList | Sort-Object -Descending
    $comp1 = Compare-Lists -InputList $InputList -DiffList $sortedList
    $comp2 = Compare-Lists -InputList $InputList -DiffList $reverseSortedList
    $sorted = ($comp1 -or $comp2)

    if ($sorted -ne $true) {
        return $false
    }

    $progressed = $true
    for ($i = 0; $i -lt ($InputList.Length - 1); $i++) {
        $diff = [System.Math]::Abs(($InputList[$i] - $InputList[$i + 1]))
        if ($diff -le 0 -or $diff -gt 3) {
            $progressed = $false
            break
        }
    }
    return ($sorted -and $progressed)
}

function Tolerate-Input {
    param (
        [int[]]$InputList
    )

    $count = 0
    $isSafe = Check-Progression -InputList $InputList
    if ($isSafe) {
        $count++
    }

    if ($isSafe -eq $false) {
        for ($i = 0; $i -lt $InputList.Length; $i++) {
            $ModList = [System.Collections.Generic.List[int]]$InputList
            $ModList.RemoveAt($i)
            $isSafe = Check-Progression -InputList $ModList
            if ($isSafe) {
                $count++
                break
            }
        }
    }

    return $count
}

function Day2Part1 {
    param (
        [PSCustomObject]$InputString
    )
    $count = 0
    foreach ($list in $InputString) {
        $list = $list -split " "
        $isSafe = Check-Progression -InputList $list
        if ($isSafe) {
            $count++
        }
    }
    return $count
}

function Day2Part2 {
    param (
        [PSCustomObject]$InputString
    )
    $count = 0
    foreach ($list in $InputString) {
        $list = $list -split " "
        $list = [int[]]$list
        $count += Tolerate-Input -InputList $list
    }
    return $count
}

# The scoped runner
function ExecuteDay2 {
    $day2Input = Read-File -FileName .\input\day_2.txt

    $timer = New-Object ExecutionTimer
    $result = @()

    $timer.Start()
    $sol1 = Day2Part1 -InputString $day2Input
    $timer.Stop()

    $result += [SolutionObject]::new("Day 2 Part 1", $sol1, "$($timer.GetExecutionTime())")

    $timer.Start()
    $sol2 = Day2Part2 -InputString $day2Input
    $timer.Stop()

    $result += [SolutionObject]::new("Day 2 Part 2", $sol2, "$($timer.GetExecutionTime())")

    return $result
}