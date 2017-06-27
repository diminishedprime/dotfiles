import {
  eventChannel,
  END,
} from 'redux-saga'
import io from 'socket.io-client'

import {
  afIncrementHeartbeats,
  CONNECT_TO_WEBSOCKET,
} from '../redux/actions.js'


import { takeLatest, take, put } from 'redux-saga/effects'

const connectToWebsocket = function* () {
  const ws = yield io.connect('http://localhost:3000')

  const wsChan = eventChannel((emitter) => {
    ws.on('message', emitter)
    ws.on('disconnect', () => emitter(END))
    return () => ws.disconnect()
  })

  try {
    for (;;) {
      const message = yield take(wsChan)
      if (message === 'heartbeat') {
        yield put(afIncrementHeartbeats())
      } else {
        // eslint-disable-next-line no-console
        console.log(message)
      }
    }
  } finally {
    ws.disconnect()
  }
}

export default function* () {
  yield takeLatest(CONNECT_TO_WEBSOCKET, connectToWebsocket)
}
