import R from 'ramda'

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
} from 'redux-saga/effects'

const userDisconnected = function* () {
  yield takeEvery(USER_DISCONNECTED, function* ({userId}) {
    yield put(afRemoveUser(userId))
    /* TODO: any other logic for when a user disconnects from websocket.*/
  })
}

const userConnected = function* () {
  yield takeEvery(USER_CONNECTED, function* ({userId, ws}) {
    yield put(afAddUser(userId, ws))
    const setUserId = afSetUserId(userId)
    yield put(afBroadcastActionToUserId(userId, setUserId))
    yield put(afBroadcastMessageToUserId(userId, 'Thanks for connecting via websockets'))
    /* TODO: any other logic for when a user connects to a websocket*/
  })
}

export default function* () {
  yield all([
    userConnected(),
    userDisconnected(),
  ])
}
