import R from 'ramda'

const usersA = ['users']
const userByUserIdA = (userId) => [...usersA, userId]
const wsByUserIdA = (userId) => [...userByUserIdA(userId), 'ws']

export const usersP = R.lensPath(usersA)
export const userByUserIdP = (userId) => R.lensPath(userByUserIdA(userId))
export const wsByUserIdP = (userId) => R.lensPath(wsByUserIdA(userId))
