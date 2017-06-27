import R from 'ramda'

import {
  initialState,
  initialErrorState,
  initialActionLog,
} from './initial-state.js'
import {
  replayingPath,
  counterPath,
  heartbeatsPath,
  hiPath,
  errorPath,
  errorTextPath,
  errorSeverityPath,
  actionLogPath,
} from './paths.js'
import {
  SET_REPLAYING,
  RESET_STATE,
  CLEAR_ACTION_LOG,
  ADD_ACTION,
  DISMISS_ERROR,
  ERROR_OCCURED,
  APPEND_HI,
  INCREMENT_HEARTBEATS,
  INCREMENT_COUNTER,
} from './actions.js'

// Reducers
const clearActionLogReducer = (state, _) =>
  R.set(actionLogPath, initialActionLog, state)

const addAction = (state, {action}) =>
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

const setReplaying = (state, {flag}) =>
  R.set(replayingPath, flag, state)

export const app = (state=initialState, action) => {
  switch(action.type) {
    case SET_REPLAYING: return setReplaying(state, action)
    case RESET_STATE:
      return initialState
    case CLEAR_ACTION_LOG:
      return clearActionLogReducer(state, action)
    case ADD_ACTION:
      return addAction(state, action)
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
