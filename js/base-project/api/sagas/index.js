import runTimer from './timer.js'

import {
  all,
} from 'redux-saga/effects'

export const rootSaga = function* () {
  yield all([
    runTimer(),
  ])
}