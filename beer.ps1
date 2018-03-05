#Functions:
#Gives 1 beer for every 4 caps, with the remainder being saved
function ReturnCaps($x){
    $CapsToSpend = ($x - ($x % 4))
    $NewBeersFromCaps = ($CapsToSpend / 4)
    $CapsLeft = $x - $CapsToSpend
   
    $NewBeersFromCaps
    $CapsLeft
    $CapsToSpend
}
 
#Gives 1 beer for every 2 bottles with the remainder being saved
function ReturnBottles($x){
    $BottlesToSpend = ($x - ($x % 2))
    $NewBeersFromBottles = ($BottlesToSpend / 2)
    $BottlesLeft = $x - $BottlesToSpend
    
    $NewBeersFromBottles
    $BottlesLeft
    $BottlesToSpend
}
 
#Gets the number of caps and bottles based on number of beers (1 for 1)
function DrinkBeers($x){
    $Caps = $x
    $Bottles = $x
 
    $Caps
    $Bottles
}
 
#Main:
 
$BeerCount = $args[0] #The number of beers you have. Pass as a parameter for starting number.
$TotalBeers = 0 #Total beers throughout the night.
$Round = 0
 
#If you have any beers, drink them!
While ($BeerCount -gt 0) {
   
    #1st, drink the beers you have in hand. Chug Chug Chug...
    $varCapsBottles = drinkBeers($BeerCount)
    $Round++
 
    #Track stuff
    $TotalBeers = $TotalBeers + $BeerCount
    $CapCount = $CapCount + $varCapsBottles[0]
    $BottleCount = $BottleCount + $varCapsBottles[1]
   
    if ($BeerCount -ne 1){$word = "beers"}
    else{$word = "beer"}
 
    Write-Host
    Write-Host "After round $Round ($BeerCount $word):"
    Write-Host ""
    Write-Host "Beers you've had = $TotalBeers"
    Write-Host "Loose caps in your pile = $CapCount"
    Write-Host "Empty bottles on the table = $BottleCount"
    Write-host ""
 
    $BeerCount = 0
 
    #2nd, return as many caps as you can
    $varCaps = ReturnCaps($CapCount)
 
    #Track your remaining caps and count your beers
    $CapCount = $varCaps[1]
    $BeerCount = $BeerCount + $varCaps[0]
    $ReturnedCaps = $varCaps[2]
   
    #3rd, return as many bottles as you can
    $varBottles = ReturnBottles($BottleCount)
 
    #Track your remaining bottles and count your beers
    $BottleCount = $varBottles[1]
    $BeerCount = $BeerCount + $varBottles[0]
    $ReturnedBottles = $varBottles[2]
   
    if ($BeerCount -ne 1){$word = "beers"}
    else{$word = "beer"}
 
    if (($ReturnedCaps) -and ($ReturnedBottles)){
        Write-Host "Return $ReturnedCaps caps and $ReturnedBottles bottles for $BeerCount more $word!"
    }
    elseif ($ReturnedCaps -gt 3){
        Write-Host "Return $ReturnedCaps caps for $BeerCount more $word!"
    }
    elseif ($ReturnedBottles -gt 1){
        Write-Host "Return $ReturnedBottles bottles for $BeerCount more $word!"
    }
    else {
        Write-Host "You don't have enough caps or bottles to get more beer. Get an Uber and go home."
    }
 
    Write-Host ""
    Write-Host "-----"
   
}