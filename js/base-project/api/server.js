import path from 'path'
import {
  createServer,
} from 'http'

import express from 'express'

import {
  store,
} from './redux/index.js'
import {
  afConnectWebsocketServer,
} from './redux/actions.js'
import addRoutes from './routes.js'

const APP_PORT = 3003

const app = express()

// Add api routes
addRoutes(app)

const server = createServer(app)

store.dispatch(afConnectWebsocketServer(server))

// Serve static resources
app.use('/', express.static(path.resolve(__dirname + '../build/')))

server.listen(APP_PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`App is now running at http://localhost:${APP_PORT}`)
})
