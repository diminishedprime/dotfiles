import {
  eventChannel,
} from 'redux-saga'
import io from 'socket.io-client'

import {
  MESSAGE,
  ACTION,
} from '../../constants.js'
import {
  CONNECT_TO_WEBSOCKET,
} from '../actions.js'

import {
  take,
  takeLatest,
  all,
  put,
} from 'redux-saga/effects'

const onMessage = function* (messageChan) {
  let message
  while ((message = yield take(messageChan))) {
    // eslint-disable-next-line no-console
    console.log(message)
  }
}

const onAction = function* (actionChan) {
  let action
  while ((action = yield take(actionChan))) {
    yield put(action)
  }
}

const connectToWebsocket = function* () {
  const ws = yield io.connect('http://localhost:3000')

  const messageChan = eventChannel((emitter) => {
    ws.on(MESSAGE, emitter)
    return () => ws.disconnect()
  })

  const actionChan = eventChannel((emitter) => {
    ws.on(ACTION, emitter)
    return () => ws.disconnect()
  })

  try {
    yield all([
      onMessage(messageChan),
      onAction(actionChan),
    ])
  } finally {
    ws.disconnect()
  }
}

export default function* () {
  yield takeLatest(CONNECT_TO_WEBSOCKET, connectToWebsocket)
}
