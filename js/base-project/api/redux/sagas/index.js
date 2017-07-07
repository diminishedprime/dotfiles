import app from './app.js'
import runTimer from './timer.js'
import websocket from './websocket.js'

import {
  all,
} from 'redux-saga/effects'

export const rootSaga = function* () {
  yield all([
    app(),
    runTimer(),
    websocket(),
  ])
}
