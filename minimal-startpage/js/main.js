//
//
// Random  Quote Generator
//
//
const quotes = ["UNIX is basically a simple operating system, but you have to be a genius to understand the simplicity.@~Dennis Ritchie" ];
let rnum = Math.floor(Math.random() * quotes.length);
let startQuote = quotes[rnum];
let splitQuote = startQuote.split("@");
let finalQuote = splitQuote[0];
let finalAuthor = splitQuote[1];
document.getElementById('quote').innerHTML = finalQuote;
document.getElementById('author').innerHTML = finalAuthor;
