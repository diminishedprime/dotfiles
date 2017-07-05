export const ADD_USER = 'new user'
export const afAddUser = (userId, ws) => ({
  type: ADD_USER,
  ws,
  userId,
})

export const REMOVE_USER = 'remove user'
export const afRemoveUser = (userId) => ({
  type: REMOVE_USER,
  userId,
})

// Aysnc Actions
const asyncConst = (val) => 'async' + val

export const START_TIMER = 'async start timer'
export const afStartTimer = () => ({
  type: START_TIMER,
})

export const STOP_TIMER = 'async stop timer'
export const afStopTimer = () => ({
  type: STOP_TIMER,
})

export const BROADCAST_MESSAGE_TO_USER_ID = asyncConst('message user id')
export const afBroadcastMessageToUserId = (userId, message) => ({
  type: BROADCAST_MESSAGE_TO_USER_ID,
  userId,
  message,
})
export const BROADCAST_MESSAGE_TO_USER_IDS = asyncConst('message user ids')
export const afBroadcastMessageToUserIds = (userIds, message) => ({
  type: BROADCAST_MESSAGE_TO_USER_IDS,
  userIds,
  message,
})
export const BROADCAST_MESSAGE_TO_ALL = asyncConst('message all')
export const afBroadcastMessageToAll = (message) => ({
  type: BROADCAST_MESSAGE_TO_ALL,
  message,
})

export const BROADCAST_ACTION_TO_USER_ID = asyncConst('action user id')
export const afBroadcastActionToUserId = (userId, action) => ({
  type: BROADCAST_ACTION_TO_USER_ID,
  userId,
  action,
})
export const BROADCAST_ACTION_TO_USER_IDS = asyncConst('action user ids')
export const afBroadcastActionToUserIds = (userIds, action) => ({
  type: BROADCAST_ACTION_TO_USER_IDS,
  userIds,
  action,
})
export const BROADCAST_ACTION_TO_ALL = asyncConst('action all')
export const afBroadcastActionToAll = (action) => ({
  type: BROADCAST_ACTION_TO_ALL,
  action,
})

export const CONNECT_WEBSOCKET_SERVER = 'async connect websocket server'
export const afConnectWebsocketServer = (httpServer) => ({
  type: CONNECT_WEBSOCKET_SERVER,
  httpServer,
})

export const USER_CONNECTED = asyncConst('user connected')
export const afUserConnected = (userId, ws) => ({
  type: USER_CONNECTED,
  userId,
  ws,
})

export const USER_DISCONNECTED = asyncConst('user disconnected')
export const afUserDisconnected = (userId) => ({
  type: USER_DISCONNECTED,
  userId,
})
