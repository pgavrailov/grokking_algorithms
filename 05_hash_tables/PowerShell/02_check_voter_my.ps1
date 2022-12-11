$voted = @{}

function Get-Voted ($voter){
    if ($voted[$voter]){
        Write-Host "Kick" $voter "out"
    } else {
        $voted[$voter] = $true
        Write-Host "Get" $voter "vote"
    }
}

Get-Voted -voter "tom"
Get-Voted -voter "tim"
Get-Voted -voter "tom"