// fetch port from command or fallback
const 
	port = (process.argv[2] || process.env.PORT || 9001),
	http = require('http')

http.createServer((req, res) => {

	console.log(req.url)

	res.statusCode = 200
	res.setHeader('Content-Type', 'text/html')
	res.end(`<h1>Hello World!</h1>`)
}).listen(port)

console.log(`Server running at http://localhost:${ port }/`)
