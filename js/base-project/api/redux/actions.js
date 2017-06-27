export const ADD_USER = 'new user'
export const afAddUser = (ws) => ({
  type: ADD_USER,
  ws,
})

export const REMOVE_USER = 'remove user'
export const afRemoveUser = (ws) => ({
  type: REMOVE_USER,
  ws,
})

// Aysnc Actions
export const START_TIMER = 'async start timer'
export const afStartTimer = () => ({
  type: START_TIMER,
})

export const STOP_TIMER = 'async stop timer'
export const afStopTimer = () => ({
  type: STOP_TIMER,
})

export const BROADCAST_MESSAGE = 'async broadcast message'
export const afBroadcastMessage = (message) => ({
  type: BROADCAST_MESSAGE,
  message,
})

export const BROADCAST_ACTION = 'async broadcast action'
export const afBroadcastAction = (action) => ({
  type: BROADCAST_ACTION,
  action,
})

export const CONNECT_WEBSOCKET_SERVER = 'async connect websocket server'
export const afConnectWebsocketServer = (httpServer) => ({
  type: CONNECT_WEBSOCKET_SERVER,
  httpServer,
})
