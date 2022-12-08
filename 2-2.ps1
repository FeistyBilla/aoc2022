$total = 0
Get-Content -Path ".\2-1.txt" | ForEach-Object -Process {
    $score = 0
    $call = ($_).SubString(0,1)
    $response = ($_).SubString(2,1)
    switch ($call) {
        "A" {
            switch ($response) {
                "X" { $score += 3 }
                "Y" { $score += 4 }
                "Z" { $score += 8 }
                Default {}
            }
        }
        "B" {
            switch ($response) {
                "X" { $score += 1 }
                "Y" { $score += 5 }
                "Z" { $score += 9 }
                Default {}
            }
        }
        "C" {
            switch ($response) {
                "X" { $score += 2 }
                "Y" { $score += 6 }
                "Z" { $score += 7 }
                Default {}
            }
        }
    }
    $total += $score
}
Write-Host $total -ForegroundColor DarkGreen
