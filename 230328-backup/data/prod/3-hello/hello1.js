// #!/usr/bin/env node

/*
The process.argv property in the standard library returns an array containing the command-line arguments:
	- the first (element 0) is the node command itself
	- the second (element 1) is the script you’re running (hello.js)
	- the third (element 2) is the first argument passed
*/

// fetch name from comand or fallback
const nameArg = (process.argv[2] || 'world')

//output message
console.log(`Hello ${ nameArg }!`)
