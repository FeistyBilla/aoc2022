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
$sacks = Get-Content -Path .\3-1.txt
$sacks_n = ($sacks).Length
for ($i = 0; $i -lt $sacks_n; $i++) {
    $global:dup_item = ""
    $sack_1 = $sacks[$i]
    $sack_1_items = $sack_1.ToCharArray()
    $i++
    $sack_2 = $sacks[$i]
    $sack_2n = ($sack_2).length
    $sack_2_index = 0..($sack_2n - 1)
    $i++
    $sack_3 = $sacks[$i]
    $sack_3n = ($sack_3).length
    $sack_3_index = 0..($sack_3n - 1)
    :sack_search foreach ($sack_1_item in $sack_1_items) {
        foreach ($sack_2i in $sack_2_index) {
            if ($sack_1_item -ceq $sack_2[$sack_2i]) {
                foreach ($sack_3i in $sack_3_index) {
                    if ($sack_1_item -ceq $sack_3[$sack_3i]) {
                        $global:dup_item = $sack_1_item
                        break sack_search
                    }
                }
            }
        }
    }
    $points_total += ($index | Where-Object {($_).Item -ceq $global:dup_item}).Score
}
Write-Host $points_total -ForegroundColor DarkGreen
