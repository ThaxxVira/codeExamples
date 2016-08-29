// Practice project from Codecademy
// Written by Matthew Little, 29 August 2016
// --------------
// --------------
// This is a simple "choose your own adventure" style story game
// Asks if user wants to play a game
confirm("Do you want to play a game?")
// Asks user for their age
var ageClaimed = prompt("What is your age?");
// Checks to see if user is old enough to play the game
if (ageClaimed < 13) {
    console.log("You can play, but ask your parents.");
} else {
    console.log("Good.  Let's play.");
}
// Begin story
console.log("You are at a Justin Bieber concert, and you hear this lyric 'Lace my shoes off, start racing.'  You have no idea what this means.");
console.log("Suddenly, Bieber stops and says, 'Who wants to race me?'");
// user answer to Mr. Bieber's inquery
userAnswer = prompt("Do you want to race Mr. Bieber on stage?  (Type Yes or No)");
if (userAnswer == "Yes") {
    console.log("You and Bieber start racing. It's neck and neck! Suddenly, Mr. Bieber pushes you off the stage!  You fall and fracture your skull and are taken to the medical section of the concert.  You die 3 days later and Justin Bieber 'rocks' on.");
} else {
    console.log("Someone else jumps on stage and races with Mr. Bieber.  You see the fan shoved off the stage just as he is about to win.  It looks like it was a good choice not to get involved this time.'");
}
//feedback request
feedback = prompt("Did you like this game?  Please rate it on a scale of 1 to 10, 10 indicating you loved it.");
if (feedback > 8) {
    console.log("Thank you! Race The Beebs with caution!");
} else {
    console.log("I'll keep practicing coding and avoid racing The Beebs.");
}