$sum_calories = 0
$output = @()
Get-Content -Path ".\1-1.txt" | ForEach-Object -Process {
    if ($_) {
        $sum_calories += $_
    } else {
        $elf_calories = [PSCustomObject]@{
            elf_total = $sum_calories
        }
    $output += $elf_calories 
    $sum_calories = 0
    }        
}
$top_3 = 0
($output | Sort-Object Elf_Total -Descending | Select-Object Elf_Total -First 3).Elf_Total | ForEach-Object {$top_3 += $_}
Write-Host $top_3 -ForegroundColor DarkGreen
