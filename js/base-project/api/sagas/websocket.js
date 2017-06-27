import R from 'ramda'
import io from 'socket.io'
import {
  eventChannel,
} from 'redux-saga'

import {
  usersPath,
} from '../redux/paths.js'
import {
  CONNECT_WEBSOCKET_SERVER,
  BROADCAST_MESSAGE,
  BROADCAST_ACTION,
  afAddUser,
  afRemoveUser,
  afBroadcastMessage,
} from '../redux/actions.js'

import {
  fork,
  put,
  actionChannel,
  take,
  all,
  select,
} from 'redux-saga/effects'

const broadcastMessage = function* () {
  const channel = yield actionChannel(BROADCAST_MESSAGE)

  let action
  while((action = yield take(channel))) {
    const { message } = action
    const users = yield select(R.view(usersPath))
    users.forEach((ws) => ws.emit('message', message))
  }
}

const broadcastAction = function* () {
  const channel = yield actionChannel(BROADCAST_ACTION)

  let chanAction
  while((chanAction = yield take(channel))) {
    const { action } = chanAction
    const users = yield select(R.view(usersPath))
    users.forEach(({ws}) => ws.emit('action', action))
  }
}

const addUser = function* (ws) {
  yield(put(afAddUser(ws)))
  ws.emit('message', 'thanks for connecting via websockets')
}

const removeUser = function* (disconnectChan) {
  let ws
  while ((ws = yield take(disconnectChan))) {
    yield(put(afRemoveUser(ws)))
  }
}

const connectWS = function* (ws) {
  const disconnectChan = eventChannel((emitter) => {
    ws.on('disconnect', () => emitter(ws))
    // eslint-disable-next-line no-console
    return () => console.log('something unsubscribe socket')
  })

  yield all([
    removeUser(disconnectChan),
    addUser(ws),
  ])
}

const startHeartbeat = function* () {
  const heartbeatChan = eventChannel((emitter) => {
    const iv = setInterval(() => emitter('heartbeat'), 1000)
    return () => clearInterval(iv)
  })
  for (;;) {
    const heartbeat = yield take(heartbeatChan)
    yield put(afBroadcastMessage(heartbeat))
  }
}

const connectWSS = function* () {
  const { httpServer } = yield take(CONNECT_WEBSOCKET_SERVER)
  const wss = io(httpServer)
  const wssConnectionChan = eventChannel((emitter) => {
    wss.on('connection', (ws) => emitter(ws))
    // eslint-disable-next-line no-console
    return () => console.log('something unsubscribe from wss emitter?')
  })
  yield fork(startHeartbeat)
  for (;;) {
    const ws = yield take(wssConnectionChan)
    yield fork(connectWS, ws)
  }
}

const websocketSaga = function* () {
  yield all([
    broadcastMessage(),
    broadcastAction(),
    connectWSS(),
  ])
}

export default websocketSaga
