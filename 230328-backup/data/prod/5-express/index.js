// Express application
import express from 'express'
import compression from 'compression'
import { fileURLToPath } from 'url'
import { dirname, sep } from 'path'
import { helloRouter } from './routes/hello.js'

// Configuration
const __dirname = dirname(fileURLToPath( import.meta.url )) + sep
const cfg = {
  port: process.env.PORT || 9001,
  dir: {
    root: __dirname,
    static: __dirname + 'static' + sep,
    views: __dirname + 'views' + sep
  }
}

console.dir(cfg, { depth: null, color: true })

const app = express()                 // Express initiation
app.disable('x-powered-by')           // do not identify express
// app.disable('favicon.ico')
app.use( compression() )              // HTTP compression

app.get('/good', (req, res) => {     // Page '/info' route
  res.render('message', { title: req.url })
})

// Srever static assets
app.use(express.static( cfg.dir.static ))
// app.use('/favicon.ico', express.static('img/favicon.ico'))

app.set('view engine', 'ejs')         // Use EJS declaration
app.set('views', cfg.dir.views)       // Use EJS template 

app.get('/', (req, res) => {          // Page '/' route
  res.render('message', { title: 'Hello, Azrubael!' })
})
app.get('/hello', (req, res) => {     // Page '/hello' route
  res.render('message', { title: 'Hello You!' })
})
app.get('/info', (req, res) => {     // Page '/info' route
  res.render('message', { title: __dirname+req.originalUrl })
})
app.use('/hello/', helloRouter)      // Page '/hello/' route


app.use((req, res) => {               // 404 error
  res.status(404).render('message', { title: 'Element not found...' })
})

app.listen(cfg.port, () => {          // Start server
  console.log(`This application listening at http://localhost:${ cfg.port }`)
})

export { cfg, app }                   // Export defaults


