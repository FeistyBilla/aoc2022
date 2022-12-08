$most_calories = 0
$sum_calories = 0
Get-Content -Path ".\1-1.txt" | ForEach-Object -Process {
    if ($_) {
        $sum_calories += $_
    } else {
        if ($sum_calories -gt $most_calories) {
            $most_calories = $sum_calories
        }
        $sum_calories = 0
    }
}
Write-Host $most_calories -ForegroundColor DarkGreen
