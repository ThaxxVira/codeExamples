// Practice project from Codecademy
// Written by Matthew Little, 29 August 2016
// --------------
// --------------
// This is a simple "Rock, Paper, Scissors game 
// Goal of project: review the use of functions
// Prompts user to choose rock, paper, or scissors
var userChoice = prompt("Do you choose rock, paper, or scissors?");
// randomize the computer choice between rock, paper, and scissors
var computerChoice = Math.random();
if (computerChoice < 0.34) {
    computerChoice = "rock";
} else if (computerChoice < 0.67) {
    computerChoice = "paper";
} else {
    computerChoice = "scissors";
}
// Print computer choice
console.log("Computer: " + computerChoice);
// function to determine winner
var compare = function (choice1, choice2) {
    if (choice1 != "rock" || choice1 != "paper" || choice1 != "scissors") {
        return "please type a valid selection";
    }
    if (choice1 == choice2) {
        return "The result is a tie!"
        
    } else if (choice1 == "rock") {
        if (choice2 == "scissors") {
            return "rock wins";
        } else {
            return "paper wins";
        }
    } else if (choice1 == "paper") {
        if (choice2 == "rock") {
            return "paper wins";
        } else {
            return "scissors wins";
        }
    } else if (choice1 == "scissors") {
        if (choice2 == "paper") {
            return "scissors wins";
        } else {
            return "rock wins";
        }
    }
};
compare(userChoice, computerChoice);