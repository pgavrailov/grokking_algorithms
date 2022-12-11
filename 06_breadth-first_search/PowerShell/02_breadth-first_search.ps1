$graph = @{}
$graph["you"] = @("alice", "bob", "claire")
$graph["bob"] = @("anuj", "peggy")
$graph["alice"] = @("peggy")
$graph["claire"] = @("thom", "jonny")
$graph["anuj"] = @()
$graph["peggy"] = @()
$graph["thom"] = @()
$graph["jonny"] = @()

Function Test-PesrsonIsSaller ($name){
    
    if(($name[$name.Length-1]) -like 'm'){
        $true
    }else {
        $false
    }
}

Function Search-Person ($name){

    $search_queue = New-Object System.Collections.Queue
    $graph[$name] | ForEach-Object{$search_queue.Enqueue($_)}
    $searched = New-Object System.Collections.Generic.List[System.Object]
    
    while ($search_queue.count -gt 0){

        $person = $search_queue.Dequeue()

        if ($person -notin $searched){

            if (Test-PesrsonIsSaller -name $person){

                Write-Host $person "is a seller!"
                return $True
                }else{

                $graph[$person] | ForEach-Object {$search_queue.Enqueue($_)}
                $searched.add($person)

            }
        }
    }
    return $false
}

Search-Person -name 'you'