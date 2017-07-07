import axios from 'axios'

import {
  afAppendHi,
  afError,
  RETRIEVE_HI,
} from '../actions.js'

import {
  put,
  takeEvery,
} from 'redux-saga/effects'

// Saga Handlers
const retrieveHiAysnc = function* () {
  try {
    const {data: hi} = yield axios.get('/hi')
    yield put(afAppendHi(hi))
  } catch (error) {
    yield put(afError('The request to \'/hi\' failed'))
  }
}

export default function* () {
  yield takeEvery(RETRIEVE_HI, retrieveHiAysnc)
}
