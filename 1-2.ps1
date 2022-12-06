$calories = Get-Content -Path ".\1-1.txt"
$sumCalories = 0
$output = @()
foreach ($calorie in $calories) {
    if ($calorie) {
        $sumCalories += $calorie
    } else {
        $sum = [PSCustomObject]@{
            Elf_Total = $sumCalories
        }
        $output += $sum 
        $sumCalories = 0
    }
}
$output = $output | Sort-Object Elf_Total -Descending
$top3_sum = ($output).Elf_Total[0] + ($output).Elf_Total[1] + ($output).Elf_Total[2]
Write-Host $top3_sum -ForegroundColor DarkGreen