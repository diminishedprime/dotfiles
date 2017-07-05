import {
  eventChannel,
} from 'redux-saga'

import {
  afSetUserId,
} from '../../../src/redux/actions.js'
import {
  afBroadcastActionToUserId,
  afRemoveUser,
  afBroadcastMessageToUserId,
  USER_DISCONNECTED,
  USER_CONNECTED,
  afAddUser,
} from '../actions.js'

import {
  put,
  all,
  takeEvery,
  take,
} from 'redux-saga/effects'

const userDisconnected = function* () {
  yield takeEvery(USER_DISCONNECTED, function* ({userId}) {
    yield put(afRemoveUser(userId))
    /* TODO: any other logic for when a user disconnects from websocket.*/
  })
}

const beatHeart = function* (userId, heartbeatChan) {
  yield take(heartbeatChan)
  yield put(afBroadcastMessageToUserId(userId, 'heartbeat'))
  yield beatHeart(userId, heartbeatChan)
}

const startHeartbeat = function* (userId) {
  const heartbeatChan = eventChannel((emitter) => {
    const iv = setInterval(() => emitter('beat'), 1000)
    return () => clearInterval(iv)
  })
  yield beatHeart(userId, heartbeatChan)
}

const userConnected = function* () {
  yield takeEvery(USER_CONNECTED, function* ({userId, ws}) {
    yield put(afAddUser(userId, ws))
    yield put(afBroadcastActionToUserId(userId, afSetUserId(userId)))
    yield put(afBroadcastMessageToUserId(userId, 'Thanks for connecting via websockets'))
    yield startHeartbeat(userId)
    /* TODO: any other logic for when a user connects to a websocket*/
  })
}

export default function* () {
  yield all([
    userConnected(),
    userDisconnected(),
  ])
}
