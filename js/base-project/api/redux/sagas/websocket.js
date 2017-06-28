import uuid4 from 'uuid/v4'
import R from 'ramda'
import io from 'socket.io'
import {
  eventChannel,
} from 'redux-saga'

import {
  MESSAGE,
  ACTION,
} from '../../../src/constants.js'
import {
  userByUserIdP,
  usersP,
} from '../paths.js'
import {
  CONNECT_WEBSOCKET_SERVER,
  BROADCAST_MESSAGE_TO_USER_IDS,
  BROADCAST_MESSAGE_TO_USER_ID,
  BROADCAST_MESSAGE_TO_ALL,
  BROADCAST_ACTION_TO_USER_IDS,
  BROADCAST_ACTION_TO_USER_ID,
  BROADCAST_ACTION_TO_ALL,
  afAddUser,
  afRemoveUser,
  afBroadcastMessageToUserId,
} from '../actions.js'

import {
  fork,
  put,
  take,
  all,
  select,
  takeEvery,
} from 'redux-saga/effects'

const broadcastMessageToUserId = function* () {
  yield takeEvery(BROADCAST_MESSAGE_TO_USER_ID, function* ({userId, message}) {
    const { ws } = yield select(R.view(userByUserIdP(userId)))
    ws.emit(MESSAGE, message)
  })
}
const broadcastMessageToUserIds = function* () {
  yield takeEvery(BROADCAST_MESSAGE_TO_USER_IDS, function* ({userIds, message}) {
    const users = yield select(R.view(usersP))
    users.forEach(({ws, userId}) => {
      if (R.contains(userId, userIds)) {
        ws.emit(MESSAGE, message)
      }
    })
  })
}
const broadcastMessageToAll = function* () {
  yield takeEvery(BROADCAST_MESSAGE_TO_ALL, function* ({message}) {
    const users = yield select(R.view(usersP))
    users.forEach(({ws}) => {
      ws.emit(MESSAGE, message)
    })
  })
}
const broadcastActionToUserId = function* () {
  yield takeEvery(BROADCAST_ACTION_TO_USER_ID, function* ({userId, action}) {
    const { ws } = yield select(R.view(userByUserIdP(userId)))
    ws.emit(ACTION, action)
  })
}
const broadcastActionToUserIds = function* () {
  yield takeEvery(BROADCAST_ACTION_TO_USER_IDS, function* ({userIds, action}) {
    const users = yield select(R.view(usersP))
    users.forEach(({ws, userId}) => {
      if (R.contains(userId, userIds)) {
        ws.emit(ACTION, action)
      }
    })
  })
}
const broadcastActionToAll = function* () {
  yield takeEvery(BROADCAST_ACTION_TO_ALL, function* ({action}) {
    const users = yield select(R.view(usersP))
    users.forEach(({ws}) => {
      ws.emit(ACTION, action)
    })
  })
}

const connectWS = function* (ws) {
  const userId = uuid4()
  const disconnectChan = eventChannel((emitter) => {
    ws.on('disconnect', () => emitter(userId))
    // eslint-disable-next-line no-console
    return () => console.log('something unsubscribe socket')
  })
  yield(put(afAddUser(userId, ws)))
  yield(put(afBroadcastMessageToUserId(
    userId,
    'thanks for connecting via websockets')))
  yield take(disconnectChan)
  yield(put(afRemoveUser(userId)))
}

const connectWSS = function* () {
  const { httpServer } = yield take(CONNECT_WEBSOCKET_SERVER)
  const wss = io(httpServer)
  const wssConnectionChan = eventChannel((emitter) => {
    wss.on('connection', (ws) => emitter(ws))
    // eslint-disable-next-line no-console
    return () => console.log('something unsubscribe from wss emitter?')
  })
  let ws
  while ((ws = yield take(wssConnectionChan))) {
    yield fork(connectWS, ws)
  }
}

const websocketSaga = function* () {
  yield all([
    broadcastMessageToUserIds(),
    broadcastMessageToUserId(),
    broadcastMessageToAll(),
    broadcastActionToUserIds(),
    broadcastActionToUserId(),
    broadcastActionToAll(),
    connectWSS(),
  ])
}

export default websocketSaga
