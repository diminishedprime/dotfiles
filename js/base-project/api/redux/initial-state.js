import R from 'ramda'

import {
  usersPath,
} from './paths.js'

const setUpUsers = (state) => R.compose(
  R.set(usersPath, {})
)(state)

export const initialState = R.compose(
  setUpUsers
)({})
