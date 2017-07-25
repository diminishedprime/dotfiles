import {
  initialState,
} from './initial-state.js'

export const app = (state=initialState, action) => {
  switch(action.type) {
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
