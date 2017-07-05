import R from 'ramda'

import {
  initialState,
} from './initial-state.js'
import {
  userByUserIdPath,
  usersPath,
} from './paths.js'
import {
  ADD_USER,
  REMOVE_USER,
} from './actions.js'

const addUser = (state, {userId, ws}) =>
  R.set(userByUserIdPath(userId), {userId, ws}, state)

const removeUser = (state, {userId}) =>
  R.over(usersPath, R.dissoc(userId), state)

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
