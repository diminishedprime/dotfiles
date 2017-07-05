import {
  delay,
} from 'redux-saga'

import {
  afIncrementCounter,
  ASYNC_INCREMENT_COUNTER,
} from '../actions.js'

import {
  actionChannel,
  take,
  put,
} from 'redux-saga/effects'

const incrementCounter = function* () {
  const channel = yield actionChannel(ASYNC_INCREMENT_COUNTER)

  while(yield take(channel)) {
    yield delay(1000)
    yield put(afIncrementCounter())
  }
}

export default incrementCounter
