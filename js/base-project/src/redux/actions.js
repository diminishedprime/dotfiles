export const INCREMENT_HEARTBEATS = 'increment heartbeats'
export const afIncrementHeartbeats = () => ({
  type: INCREMENT_HEARTBEATS,
})

export const INCREMENT_COUNTER = 'increment counter'
export const afIncrementCounter = () => ({
  type: INCREMENT_COUNTER,
})

export const APPEND_HI = 'append hi'
export const afAppendHi = (hi) => ({
  type: APPEND_HI,
  hi,
})

export const ERROR_OCCURED = 'an error has occured'
export const afError = (text, severity) => ({
  type: ERROR_OCCURED,
  text,
  severity,
})

export const DISMISS_ERROR = 'dismiss error'
export const afDismissError = () => ({
  type: DISMISS_ERROR,
})

export const CLEAR_ACTION_LOG = 'clear action log'
export const afClearActionLog = () => ({
  type: CLEAR_ACTION_LOG,
})

// Async Actions
const asyncConst = (value) => 'async ' + value

export const RESET_STATE = asyncConst('reset state')
export const afResetState = () => ({
  type: RESET_STATE,
})

export const RETRIEVE_HI = asyncConst('retrieve hi')
export const afRetrieveHi = () => ({
  type: RETRIEVE_HI,
})

export const CONNECT_TO_WEBSOCKET = asyncConst('connect to websocket')
export const afConnectToWebsocket = () => ({
  type: CONNECT_TO_WEBSOCKET,
})

export const ASYNC_INCREMENT_COUNTER = asyncConst('increment counter')
export const afAsyncIncrementCounter = () => ({
  type: ASYNC_INCREMENT_COUNTER,
})

export const REPLAY_ACTIONS = asyncConst('replay actions')
export const afReplayActions = () => ({
  type: REPLAY_ACTIONS,
})

export const SET_REPLAYING = asyncConst('set replaying')
export const afSetReplaying = (flag=true) => ({
  type: SET_REPLAYING,
  flag,
})


export const ADD_ACTION = asyncConst('add to action log')
export const afAddAction = (action) => ({
  type: ADD_ACTION,
  action,
  timestamp: new Date(),
})

export const SET_USER_ID = 'set user id'
export const afSetUserId = (userId) => ({
  type: SET_USER_ID,
  userId,
})
