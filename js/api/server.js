import express from 'express'
import addRoutes from './routes.js'

const APP_PORT = 3003

const app = express()

// Add api routes
addRoutes(app)

// Serve static resources
/* import path from 'path'
 * app.use('/', express.static(path.resolve(__dirname, 'public')))*/

app.listen(APP_PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`App is now running at http://localhost:${APP_PORT}`)
})
