$index = @()
$points_total = 0
$alpha_int = 0
for ($score = 1; $score -lt 53; $score++) {
    if ($score -lt 27) {
        $alpha_int = ($score + 96)
    } else {
        $alpha_int = ($score + 38)
    }
    $record = [PSCustomObject]@{
        'Score' = $score
        'Item'  = [char]$alpha_int
    }
    $index += $record
}
Get-Content -Path .\3-1.txt | ForEach-Object -Process {
    $global:dup_item = ""
    $n = ($_).length
    $half = $n / 2
    $sack_1 = ($_).Substring(0,$half)
    $sack_2 = ($_).Substring(($n-$half),$half)
    $sack_1_items = $sack_1.ToCharArray()
    $sack_2_index = 0..($half-1)
    :sack_search foreach ($sack_1_item in $sack_1_items) {
        foreach ($sack_2i in $sack_2_index) {
            if ($sack_1_item -ceq $sack_2[$sack_2i]) {
                $global:dup_item = $sack_1_item
                break sack_search
            }
        }
    }
    $points_total += ($index | Where-Object {($_).Item -ceq $global:dup_item}).Score
}
Write-Host $points_total -ForegroundColor DarkGreen
