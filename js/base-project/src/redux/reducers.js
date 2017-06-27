import R from 'ramda'

import {
  initialState,
  initialErrorState,
  initialActionLog,
} from './initial-state.js'
import {
  counterPath,
  heartbeatsPath,
  hiPath,
  errorPath,
  errorTextPath,
  errorSeverityPath,
  actionLogPath,
  replayingPath,
} from './paths.js'
import {
  RESET_STATE,
  REPLAYING,
  CLEAR_ACTION_LOG,
  ADD_TO_ACTION_LOG,
  DISMISS_ERROR,
  ERROR_OCCURED,
  APPEND_HI,
  INCREMENT_HEARTBEATS,
  INCREMENT_COUNTER,
} from './actions.js'

// Reducers
const replayingActionReducer = (state, {flag}) =>
  R.set(replayingPath, flag, state)

const clearActionLogReducer = (state, _) =>
  R.set(actionLogPath, initialActionLog, state)

const addToActionLogReducer = (state, action) =>
  R.over(actionLogPath, R.append(action), state)

const incrementCounterReducer = (state, _) =>
  R.over(counterPath, R.inc, state)

const incrementHeartbeatReducer = (state, _) =>
  R.over(heartbeatsPath, R.inc, state)

const appendHiReducer = (state, {hi}) =>
  R.over(hiPath, R.append(hi), state)

const hiErrorReducer = (state, {
  text='The request failed',
  severity='error',
}) =>
  R.set(errorSeverityPath, severity, R.set(errorTextPath, text, state))

const dismissErrorReducer = (state, _) =>
  R.set(errorPath, initialErrorState, state)

export const appReducer = (state=initialState, action) => {
  switch(action.type) {
    case REPLAYING:
      return replayingActionReducer(state, action)
    case RESET_STATE:
      return initialState
    case CLEAR_ACTION_LOG:
      return clearActionLogReducer(state, action)
    case ADD_TO_ACTION_LOG:
      return addToActionLogReducer(state, action)
    case DISMISS_ERROR:
      return dismissErrorReducer(state, action)
    case ERROR_OCCURED:
      return hiErrorReducer(state, action)
    case APPEND_HI:
      return appendHiReducer(state, action)
    case INCREMENT_HEARTBEATS:
      return incrementHeartbeatReducer(state, action)
    case INCREMENT_COUNTER:
      return incrementCounterReducer(state, action)
    default:
      if (!(
        action.type.startsWith('async') ||
        action.type.startsWith('@@redux')
      )) {
        // eslint-disable-next-line no-console
        console.log(`${action.type} not handled`)
      }
      return state
  }

}
