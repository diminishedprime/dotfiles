import {
  delay,
} from 'redux-saga'

import {
  START_TIMER,
  STOP_TIMER,
  afBroadcastMessageToAll,
}from '../actions.js'

import {
  take,
  race,
  put,
  takeLatest,
} from 'redux-saga/effects'

const timer = function* () {
  yield takeLatest(START_TIMER, function* () {
    for (let seconds = 6; seconds >= 0; seconds--) {
      const { tick, stopped } = yield race({
        stopped: take(STOP_TIMER),
        tick: delay(1000),
      })
      if (tick) {
        yield put(afBroadcastMessageToAll(seconds))
      } else if (stopped) {
        // eslint-disable-next-line no-console
        console.log('stopped intentially, you might want to add logic here')
      }
    }
  })
}

export default timer
