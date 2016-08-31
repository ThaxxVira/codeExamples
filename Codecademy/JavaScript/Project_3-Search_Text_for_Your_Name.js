// Practice project from Codecademy
// Written by Matthew Little, 31 August 2016
// --------------
// --------------
// This is a simple script to search a string for a name
// Goals of project: review the use of for loops, fine-tune code, debugging
/*jshint multistr:true */
// initializes variables:  text, muName, hits
var text = "What are you doing tonight Matthew?  I am going to the \
award show, I was hoping you would come with me.  If not, that's cool, \
I will find another stooge if you are too cool, Matthew, like Michael"; 
var myName = "Matthew";
var hits = [];
// Loops through text variable
for (var i = 0; i < text.length; i++) {
    // looks for the first letter of the name
    if (text[i] === myName[0]) {
        // initialize a temporary variable to use to compare strings
        possibleMatch = "";
        // Adds characters to the temporary variable up to the length of myName
        for (j = i; j < (myName.length + i); j++) {
                possibleMatch += text[j];
        }
        // Checks to see if the name found and myName matches and adds the string to the hits array if true
        if (possibleMatch == myName) {                    
            hits.push(possibleMatch);
        }
    }
}
// Messages displayed dependent on if the name was found, and displays the number of times the name was found
if (hits.length === 0) {
   console.log("Your name wasn't found!");
} else {
    console.log("The array of names is: ");
    console.log(hits);
    console.log("The number of times the name was found is: " + hits.length);
}
