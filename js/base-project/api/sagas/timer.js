import {
  START_TIMER,
  STOP_TIMER,
  afTimerTick,
} from '../../src/redux/actions.js'

import {
  actionChannel,
  call,
  take,
  race,
  put,
} from 'redux-saga/effects'

const wait = (millis) => (
  new Promise((resolve) => {
    setTimeout(() => resolve(), millis)
  })
)

const runTimer = function* () {
  const channel = yield actionChannel(START_TIMER)

  while(yield take(channel)) {
    let seconds = 60
    for (;;) {
      const { stopped } = yield race({
        stopped: take(STOP_TIMER),
        tick: call(wait, 1000),
      })

      if (!stopped) {
        seconds--
        if (seconds === 0) {
          // Yield anything that should happen at the timer being over
        } else {
          // Yield anything that should happen during the timer tick
          yield put(afTimerTick(seconds))
        }
      } else {
        break
      }
    }
  }
}

export default runTimer
