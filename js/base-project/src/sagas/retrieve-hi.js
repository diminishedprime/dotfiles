import axios from 'axios'

import {
  afAppendHi,
  afError,
} from '../redux.js'

import {
  put,
  takeEvery,
} from 'redux-saga/effects'



const RETRIEVE_HI = 'async retrieve hi'
export const afRetrieveHi = () => ({
  type: RETRIEVE_HI,
})

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
