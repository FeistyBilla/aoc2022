$total = 0
Get-Content -Path ".\2-1.txt" | ForEach-Object -Process {
    $score = 0
    $call = ($_).SubString(0,1)
    $response = ($_).SubString(2,1)
    switch ($call) {
        "A" {
            switch ($response) {
                "X" { $score += 4 }
                "Y" { $score += 8 }
                "Z" { $score += 3 }
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
                "X" { $score += 7 }
                "Y" { $score += 2 }
                "Z" { $score += 6 }
                Default {}
            }
        }
    }
    $total += $score
}
Write-Host $total -ForegroundColor DarkGreen
