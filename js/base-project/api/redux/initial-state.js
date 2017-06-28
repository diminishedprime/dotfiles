import R from 'ramda'

import {
  usersP,
} from './paths.js'

const setUpUsers = (state) => R.compose(
  R.set(usersP, {})
)(state)

export const initialState = R.compose(
  setUpUsers
)({})
