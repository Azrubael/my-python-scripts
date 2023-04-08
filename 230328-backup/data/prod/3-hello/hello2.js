// fetch name from comand or fallback
const nameArg = (process.argv[2] || process.env.USER || process.env.USERNAME || 'world')

//output message
console.log(`Hello ${ nameArg }!`)
