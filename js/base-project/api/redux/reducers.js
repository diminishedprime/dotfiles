import R from 'ramda'

import {
  usersPath,
} from './paths.js'
import {
  ADD_USER,
  REMOVE_USER,
} from './actions.js'

const initialState = {
  users: [],
}

const addUser = (state, {ws}) => R.over(usersPath, R.append(ws), state)

const removeUser = (state, {ws}) => {
  const users = R.view(usersPath, state)
  const idx = R.findIndex(R.equals(ws), users)
  return R.over(usersPath, R.remove(idx, 1), state)
}

export const app = (state=initialState, action) => {
  switch(action.type) {
    case ADD_USER: return addUser(state, action)
    case REMOVE_USER: return removeUser(state, action)
    default:
      if (!(
        action.type.startsWith('async') ||
        action.type.startsWith('@@redux')
      )) {
        // eslint-disable-next-line no-console
        console.log(`${action.type} not handled`)
      }
      return state
  }

}
