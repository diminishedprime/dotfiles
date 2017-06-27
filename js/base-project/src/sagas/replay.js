import R from 'ramda'
import {
  delay,
} from 'redux-saga'

import {
  REPLAY_ACTIONS,
  afAddAction,
  afSetReplaying,
  afResetState,
} from '../redux/actions.js'
import {
  actionLogPath,
  replayingPath,
} from '../redux/paths.js'

import {
  all,
  select,
  takeEvery,
  take,
  put,
  fork,
} from 'redux-saga/effects'

const logActions = function* () {
  let action
  while ((action = yield take('*'))) {
    if (!action.type.startsWith('async')) {
      yield put(afAddAction({...action, timestamp: new Date().getTime()}))
    }
  }
}

const delayReplay = function* (millis, action) {
  yield delay(millis)
  yield put(action)
}

const replay = function* () {
  const actionLog = yield select((state) => R.view(actionLogPath, state))
  const currentTime = new Date().getTime()
  yield put(afSetReplaying(true))
  yield put(afResetState())
  for (let i = 0; i < actionLog.length; i++) {
    const action = actionLog[i]
    const { timestamp } = action
    const relativeTime = Math.abs(currentTime - timestamp) * (1/2)
    const replayOff = ((i + 1) === actionLog.length)

    yield fork(delayReplay, relativeTime, action, replayOff)
  }
}

const runReplay = function* () {
  yield all([
    takeEvery(REPLAY_ACTIONS, replay),
    logActions(),
  ])

}

export default runReplay
