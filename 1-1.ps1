$calories = Get-Content -Path ".\1-1.txt"
$mostCalories = 0
$sumCalories = 0
foreach ($calorie in $calories) {
    if ($calorie) {
        $sumCalories += $calorie
    } else {
        if ($sumCalories -gt $mostCalories) {
            $mostCalories = $sumCalories
        }
        $sumCalories = 0
    }
}
Write-Host $mostCalories 