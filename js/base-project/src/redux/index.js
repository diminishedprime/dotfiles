import createSagaMiddleware from 'redux-saga'
import {
  createStore,
  applyMiddleware,
} from 'redux'

import {
  rootSaga,
} from '../sagas/index.js'

import {
  appReducer,
} from './reducers.js'


// Paths & Initial State

const sagaMiddleware = createSagaMiddleware()
export const store = createStore(
  appReducer,
  applyMiddleware(sagaMiddleware)
)
sagaMiddleware.run(rootSaga)
