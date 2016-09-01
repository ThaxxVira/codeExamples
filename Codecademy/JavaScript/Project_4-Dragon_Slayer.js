// Practice project from Codecademy
// Written by Matthew Little, 1 September 2016
// --------------
// --------------
// This is a simple game to kill a dragon using flow control
// Goal of project: review the use of for loops and control flow
// initializing variables
// Checks to see if the player is still trying to kill the dragon
var slaying = 1;
// Checks to see if the player successfully hit the dragon
var hitSuccess = Math.floor(Math.random() * 2);
// Determines the damage inflicted upon the dragon in a round
var damageThisRound = Math.floor(Math.random() * 5 + 1);
// Records the total damage the player inflicts upon the dragon
var totalDamage = 0;
// As long as player is slaying, game continues
while (slaying) {
    // Checks to see if player successfully hits the dragon
    if (hitSuccess == 1) {
        
        console.log("You hit the dragon for " + damageThisRound + " damage!");
        // Add round damage to total damage dragon takes 
        totalDamage += damageThisRound;
        // Calculate the number of hitpoints the dragon has left
        var dragonHitPoints = 4 - totalDamage;
        // Prints the dragon hitpoints left if more than 0
        if (dragonHitPoints > 0) {
            console.log("The dragon has " + dragonHitPoints + " hitpoints left!");
        } else {
            console.log("You strike a finishing blow!");
        }
        // checks if the damage is more than 4 to determine if player wins
        if (totalDamage >= 4) {
            console.log("You attack and the dragon is slain!");
            // Ends the game
            slaying = 0;
        } else {
            // Dragon is not dead, determines if the player successfully hits again
            hitSuccess = Math.floor(Math.random() * 2);
            // Determines a new value for damage dealy by the player
            damageThisRound = Math.floor(Math.random() * 5 + 1);
        }
    } else {
        console.log("You missed, the dragon countered, and now you are dead!");
        // ends the game
        slaying = 0;
    }
}