import runTimer from './timer.js'
import websocket from './websocket.js'

import {
  all,
} from 'redux-saga/effects'

export const rootSaga = function* () {
  yield all([
    runTimer(),
    websocket(),
  ])
}
