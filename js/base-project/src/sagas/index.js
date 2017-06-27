import incrementCounter from './increment-counter.js'
import watchConnectToWebsocket from './connect-to-websocket.js'
import apiRequests from './api-requests.js'
import runReplay from './replay.js'

import {
  all,
} from 'redux-saga/effects'

export const rootSaga = function* () {
  yield all([
    apiRequests(),
    watchConnectToWebsocket(),
    incrementCounter(),
    runReplay(),
  ])
}
