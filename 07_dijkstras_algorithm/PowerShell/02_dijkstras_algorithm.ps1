$graph = @{}
$graph['start'] = @{}
$graph['start']['a'] = 6
$graph['start']['b'] = 2

$graph['a'] = @{}
$graph['a']['fin'] = 1

$graph['b'] = @{}
$graph['b']['a'] = 3
$graph['b']['fin'] = 5

$graph['fin'] = @{}

$infinity = [float]::PositiveInfinity

$costs = [ordered]@{}
$costs['a'] = 6
$costs['b'] = 2
$costs['fin'] = $infinity

$parents = [ordered]@{}
$parents['a'] = 'start'
$parents['b'] = 'start'
$parents['fin'] = $null

$processed = New-Object System.Collections.Generic.HashSet[string]

function Find-LowestCostNode{

    param($costs)
    $lowest_cost = $infinity
    $lowest_cost_node = $null

    foreach ($node in $costs.GetEnumerator()){

        if (($node.Value -lt $lowest_cost) -and ($node.key -notin $processed)){
            $lowest_cost_node = $node.Name
            $lowest_cost = $node.value
        }
    }

    return $lowest_cost_node

}

#Find-LowestCostNode $costs

$node = Find-LowestCostNode $costs
$i = 0

while ($null -ne $node){
    $i++
    
}