export const START_TIMER = 'start timer'
export const afStartTimer = () => ({
  type: START_TIMER,
})

export const STOP_TIMER = 'start timer'
export const afStopTimer = () => ({
  type: STOP_TIMER,
})

export const TIMER_TICK = 'timer tick'
export const afTimerTick = (seconds) => ({
  type: TIMER_TICK,
  seconds,
})

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

export const ADD_TO_ACTION_LOG = 'add to action log'
export const afAddToActionLog = (action) => ({
  type: ADD_TO_ACTION_LOG,
  action,
  timestamp: new Date(),
})

export const CLEAR_ACTION_LOG = 'clear action log'
export const afClearActionLog = () => ({
  type: CLEAR_ACTION_LOG,
})

export const RESET_STATE = 'reset state'
export const afResetState = () => ({
  type: RESET_STATE,
})

export const REPLAYING = 'replaying'
export const afReplaying = (flag) => ({
  type: CLEAR_ACTION_LOG,
  flag,
})

// Async Actions
const asyncConst = (value) => 'async ' + value

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
